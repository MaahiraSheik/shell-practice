#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR: please run with this root access"
exit 1
else
echo "your is running with root access"
fi

dnf install mysql -y
