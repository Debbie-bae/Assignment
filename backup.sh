#!/bin/bash

# carrying out a check to make sure the approriate data is entered in 2 arguments

if [ $# -ne 2 ]
then
        echo "The number of arguments is not equal to 2"
        echo "Enter the right arguments"
        exit 1
fi

if ! command -v rsync >> /dev/null 2>&1
then
        echo "We have to use rsync, validate if installed"
        echo "Please use package manager to install then re-run the script again"
        exit 2
fi

# Accessing info base on time-stamp format"

timeStamp=$(date +%y-%M-%d)

backup="-avb --backup-dir $2/$timeStamp --delete"

$(which rsync) $backup $1 $2/recent >> backup_$timeStamp.log

tar -czf "$2/backup_$timeStamp.log.tar.gz" -C "$1" .

