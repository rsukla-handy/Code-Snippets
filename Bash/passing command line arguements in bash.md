#!/usr/bin/env bash

 Read command line arguments - Unix / Linux Bash Script
Q) How to read the arguments or parameters passed to a shell script from the command line?

In general the command line arguments are passed to the bash or shell script to change the behavior of the script. In this article, I am going to provide a simple shell script to read and print the command line parameters.

Take a look at the following unix shell script:

    > cat OS_Print.sh
    #!/bin/bash
    echo "Script execution starts"
    echo "$@"
    echo "$0"
    echo "$1"
    echo "$2"
    echo "$#"
    echo "Script execution ends"


The basic functionality of the above script is to print the values stored in the $ variables. Now we will run the above script by passing some arguments.

    > OS_Print.sh unix linux
    Script execution starts
    unix linux
    OS_Print.sh
    unix
    linux
    2
    Script execution ends


You can see, the command line arguments passed here are unix and linux. Command line arguments are a list of parameters separated by space delimiters passed to the shell script.

Explanation of $ variables:

    $@ : contains all the arguments
    $0 : contains script name
    $1 : First argument
    $2 : Second argument
    $n : Nth argument
    $# : Count of arguments passed.


Examples:

1. Script to iterate through arguments.

The following script prints the parameters using for loop.

    #!/bin/bash
    
    for value in $@
    do
      echo $value
    done
    

2. Print only the last argument.

There are many ways to display the last argument. The following script shows the different ways of printing the last argument.

    #!/bin/bash
    
    echo "${@: -1}"
    echo "${BASH_ARGV[0]}"
    echo "${@: $#}"
    echo "${!#}"
    
    for value in $@; do :; done
    echo $value
    

