#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR: please run with this root access"
exit 1
else
echo "your is running with root access"
fi

dnf list installed mysql
if[ $? -ne 0]
then 
echo " mysql is not insatlled...going to insatll"
dnf install mysql -y
if [ $? -eq 0 ]
then
echo "installing mysql....SUCCESS"
else
echo "Mysql not installed...FALURE"
exit 1
fi
else
echo "mysql is already insatlalled..Nothing to do"
fi

# if [ $? -eq 0 ]
# then
# echo "installing mysql....SUCCESS"
# else
# echo "Mysql not installed...FALURE"
# exit 1
# fi
