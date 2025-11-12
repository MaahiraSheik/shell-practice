#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR: please run with this root access"
exit 1
else
echo "your is running with root access"
fi

# VALIDATE(){

# if [ $1 -eq 0 ] t
# then
# echo "installing mysql $2....SUCCESS"
# else
# echo "Mysql not installed $2...FALURE"
# exit 1
# fi
# }

# dnf list installed mysql
# if [ $? -ne 0 ]
# then 
# echo " mysql is not insatlled...going to insatll"
# dnf install mysql -y
# VALIDATE $? "Mysql"
# else
# echo "mysql is already insatlalled..Nothing to do"
# fi