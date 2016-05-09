#!/usr/bin/env bash


# Save the script arguments

# command line arguments are captured in the bash_argv
# echo ${BASH_ARGV[*]}

function git_commit() {
  # use script args via the variables you saved
  # or the function args via $
  # $0 is the name of the script
  # $1 is the name of the file
#  echo $*
#  echo "$@"
for i in $(echo $1 | sed "s/,/ /g")
do
    # call your procedure/other scripts here below
    git add "$i"
done
  git commit -m $2
  git push origin $3
}

git_commit $*
