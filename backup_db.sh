#!/bin/sh

CURRENTDATE=`date +"%Y-%m-%d %T"`
path='/home/felix/backup/'

UP=$(/etc/init.d/mysql status | grep running | grep -v not | wc -l);
if [ "$UP" -ne 1 ];
then
        echo "MySQL is down.";
        echo "Running mysql server ..."
        service mysql start
        echo "MySQL is UP.";

else
        echo "All is well.";
fi



mysqldump --login-path=local moodle > $path/moodle_"$CURRENTDATE".sql









