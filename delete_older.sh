#!/bin/bash
##Deletes files older than $ARCHIVE_WINDOW_DAYS in BACKUP_DIR using filename date
##WARNING - currently will also delete all other NON pattern matching files in the directory
FILE_PREFIX=logfile.
BACKUP_DIR=/var/log/app/  ##Has to end in /
ARCHIVE_WINDOW_DAYS=3
cd $BACKUP_DIR
REMOVE_BEFORE_DATE=$((`date +%s`  -  $(( ${ARCHIVE_WINDOW_DAYS} * 86400 ))))

for backup_file in ${BACKUP_DIR}*
do 
	file_trim=${backup_file#${BACKUP_DIR}${FILE_PREFIX}}	
	file_age=`date -d${file_trim} +%s`
	if [[ ${REMOVE_BEFORE_DATE} -gt ${file_age} ]]
		then
		rm ${backup_file}
	fi
done
