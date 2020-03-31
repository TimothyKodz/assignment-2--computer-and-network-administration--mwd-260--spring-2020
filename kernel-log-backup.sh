#! /bin/bash

printf "\nChecking if kern.log is empty:\n"

if [ -s /var/log/kern.log ]
then
    printf "\nCreating backup file"
    sudo touch /var/log/kern.log.backup
    printf "\nUpdating permissions of kern.log and backup files"
    sudo chmod 664 /var/log/kern.log.backup
    sudo chmod 664 /var/log/kern.log
    printf "\nAbout to copy content of kern.log to kern.log.backup"
    sudo cp /var/log/kern.log /var/log/kern.log.backup
    printf "\nContent of kern.log copied to kern.log.backup\nEmptying content from kern.log"
    sudo cat /dev/null > /var/log/kern.log
    printf "\nResetting permissions of kern.log and backup files\n\n"
    sudo chmod 644 /var/log/kern.log.backup
    sudo chmod 644 /var/log/kern.log
else
    printf "\nkern.log is empty, exiting script\n\n"
    exit 1
fi

exit 0