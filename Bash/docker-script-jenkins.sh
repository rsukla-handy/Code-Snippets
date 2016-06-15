#!/usr/bin/env bash

set -e

#Export AWS Keys.
export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_KEY}
export AWS_DEFAULT_REGION=us-east-1
export PATH=${PATH}:/usr/local/bin

# Clone the project.
# git clone https://github.com/Handybook/service-pricing-backend.git
# cd service-pricing-backend

`aws ecr get-login`

# Kill and delete all containers.
docker-compose kill
docker-compose rm -fv

# Start the docker environment.
docker-compose ps
docker-compose pull

# Start the mysql in docker.
docker-compose up -d mysql
# mysql takes longer to initialize than most containers
sleep 5

# Setup database
docker-compose run backend bundle install
docker-compose run backend bundle exec rake db:setup
docker-compose run backend bundle exec rake db:migrate

# Start the backend containers.
docker-compose up -d backend


# Capture the backend container port.
port=$(docker-compose port backend 6500 | cut -d ":" -f 2)
docker-compose ps

# Check if container is alive.
status="not alive"

# Designate test file.
service_test_file=${service//-/_}"_tests.yaml"

# Run the tests.
rm -rf test-automation/
git clone https://handybook-deploy:${GITHUB_TOKEN}@github.com/Handybook/test-automation.git
cd test-automation/
virtualenv testenv
source testenv/bin/activate
pip install -r requirements.txt --upgrade
pip install pyresttest==1.7.1 jsonschema==2.5.1
set +e
pyresttest http://localhost:$port tests/services/${service}/${service_test_file}
export TEST_RESULT=$?

cd ${WORKSPACE}

export BUILD_RESULT=`if [ $TEST_RESULT -eq 0 ]; then echo "success"; else echo "failure"; fi`
curl -i https://api.github.com/repos/Handybook/${service}/statuses/$sha -X POST \
-H "Authorization: token $GITHUB_TOKEN" \
-d '{"state": "'$BUILD_RESULT'", "description": "Core Tests", "context": "core-tests", "target_url": "'"`echo $BUILD_URL`"'"}'

if [ $BUILD_RESULT == 'failure' ]; then
  echo "Build failed..."
  exit 1
fi





