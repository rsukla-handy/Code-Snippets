#!/usr/bin/env bash


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
    git status | grep modified | awk '{ print $2 }' | xargs git add
 else
    for i in $(echo $1 | sed "s/,/ /g")
    do
        # call your procedure/other scripts here below
        git add "$i"
    done
fi
git commit -m $2
if [ -z $3  ]
 then
    git branch | grep "*" | awk '{print $2}' | xargs git push origin
 else
    git push origin $3
fi
}

git_commit $*
