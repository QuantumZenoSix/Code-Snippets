#!/usr/bin/bash

# === Function === 
#Backs up all files of a given source dir and saves into 'gz' on the target dir

# === Running Script === 
# bash backup_devnotes [src dir] [target dur] [outputfilename]
# ^ Skip args when calling the script by passing in am empty string '' - defaults will be used

# === Defaults ===
# output file name 'archive'
# source dir name 'Dev_Notes on 'G:' drive
# target dir name 'SD card on 'D:' drive


DEV_NOTES_DIR=/mnt/e/Main/Professional/Study_notes/Dev_Notes/
SD_DIR=/mnt/g/

# Set source dir (-z checks if empty). Pass in as arg1 - default to devnotes
if [[ -z "$1" ]]
then
    SRC_DIR=$DEV_NOTES_DIR 
else
    SRC_DIR="$1"
fi

# Set target dir. Pass in as arg2 - default to sd card (G:)
if [[ -z "$2" ]]
then
    TRG_DIR=$SD_DIR
else
    TRG_DIR="$2"
fi

# Set archive name. Pass in as arg1 - default to 'archive'
if [[ -z "$3" ]]
then
    BK_NAME='archive.tar.gz' 
else
    BK_NAME="$3.tar.gz"
fi

# Create archive - FLAGS: create,verbose,zip,filename
cd $SRC_DIR; tar -cvzf $BK_NAME .

# #  Move to target dir
 mv $BK_NAME $TRG_DIR

# Extract here at target dir - disabled (commenting out for now)
# cd $TRG_DIR; tar -xf $BK_NAME
