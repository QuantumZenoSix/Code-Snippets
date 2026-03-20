#!/usr/bin/bash

# === Function === 
# Backs up all files of a given source dir and saves into 'zip' on the target dir

# === Running Script === 
# $ bash backupdir_zip.sh [src dir] [src foldername] [target dur] [extract] &
# ^ Skip args when calling the script by passing in am empty string '' - defaults will be used

# === Defaults ===
# 1. source path 'Study_notes on' on 'G:' drive
# 2. source dir name 'Dev_Notes'
# 3. targetpath SD card on 'G:' drive
# 4. Will merely drop zip - will not extract

SD_DIR=/mnt/g/

# Set source dir (-z checks if empty). Pass in as arg1 - default to devnotes
if [[ -z "$1" ]]
then
    SRC_DIR=$SD_DIR
else
    SRC_DIR="$1"
fi

# Set source folder. Pass in as arg2 - default to current dir
if [[ -z "$2" ]]
then
    echo "Source Folder Name required!"
    exit
else
    SRC_FLD="$2"
fi

# Set target dir. Pass in as arg3 - default to sd card (G:)
if [[ -z "$3" ]]
then
    TRG_DIR=/mnt/e/
else
    TRG_DIR="$3"
fi

ZIP_FILE=$SRC_FLD.zip

# Create archive - FLAGS: create,verbose,zip,filename
cd $SRC_DIR; zip -r $ZIP_FILE $SRC_FLD/

# #  Move to target dir
 mv $ZIP_FILE $TRG_DIR

# See if we're extracting
if [[ "$4" == 'extract' ]]
then
    # Extract here at target dir
    cd $TRG_DIR; unzip -o $ZIP_FILE
    rm -r $ZIP_FILE
fi


# To backup my dev notes: bash backupdir_zip.sh '' Dev_notes  /mnt/e/Main/Professional/Study_notes/ extract

# Alias
# alias backupdev="bash backupdir_zip.sh '' Dev_Notes  /mnt/e/Main/Professional/Study_notes/"