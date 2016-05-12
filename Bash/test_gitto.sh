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
if [ -z $1  ]
 then
    echo "Test is scheduling now....."
fi
    # call your procedure/other scripts here below
  echo $2
  echo $3
}

git_commit $*

