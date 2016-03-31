#!/usr/bin/env bash

declare -A arr1=([name]='androidTest' [arn]='arn:aws:devicefarm:us-west-2::device:268066CE839F45A68487E46A25EEF89E' [created]='1459270137.749')
declare -A arr2=([name]='android-provider2016-03-3015:23:30'
                 [arn]='arn:aws:devicefarm:us-west-2::device:268066CE839F45A68487E46A25EEF89E' [created]='1459365812.466')
​
# Declare array of names of associate arrays
arr_of_arrs=(arr1 arr2)
​
# Loop over names
for arr_name in "${arr_of_arrs[@]}"; do
​
    # Assign name to nameref
    declare -n arr_ref="$arr_name"
​
    # Print value of key 'arn'
    printf "%s\n" "${arr_ref[arn]}"
​
done

