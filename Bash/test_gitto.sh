#!/usr/bin/env bash

# gitto to save my time
# command line arguments are captured in the bash_argv
# echo ${BASH_ARGV[*]}

function gitto() {
for i in $(echo $1 | sed "s/,/ /g")
do
    # call your procedure/other scripts here below
    echo "$i"
done
  echo $2
  echo $3
}

gitto $*

