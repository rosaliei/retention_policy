#!/bin/bash

#Author : KCT
#Creation Date : 19.1.22
#Modified Date : 19.1.122

#Description
#Removing old backup files twice a week

#Usage
#bash retention_policy.sh or ./retention_policy.sh 

readarray -t oldbackup < <(find /whmbk/sftpuser/upload/backup/weekly -maxdepth 1 -mtime +16 -type d)

for files in "${oldbackup[@]}" ; do
        echo ""$files" is deleted on "$(date)"" >> /var/log/retention.log
        rm -rf "$files"
done

exit 0