#!/usr/bin/env bash

FILE=$1
NEW_FILE="${FILE:0:-3}-cut.pl"
IN_CUT_BLOCK=0


while read line
do
    # echo $line

    # If we just entered cut block...
    if [[ "$line" =~ ^= && $IN_CUT_BLOCK -eq 0 ]] ;then
        IN_CUT_BLOCK=1

    elif [[ $IN_CUT_BLOCK -eq 0 ]]; then
        echo "${line}" >> ${NEW_FILE}
    # If we are about to exit cut block...
    elif [[ "$line" =~ ^= && $IN_CUT_BLOCK -eq 1 ]] ;then
        IN_CUT_BLOCK=0
    fi


done < $FILE

# Format file
perltidy ${NEW_FILE}

# RENAME
# RENAME
mv -f "${NEW_FILE}.tdy" ${NEW_FILE}

