#! /bin/bash

branches=(`git branch`)

for i in ${branches[@]}
do
    pattern="^DEV-"

    if [[ $i =~ $pattern ]] 
        then echo `git branch -D $i`
    fi
done
