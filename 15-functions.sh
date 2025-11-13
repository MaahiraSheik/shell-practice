#!/bin/bash


USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "ERROR: please run with this root access"
exit 1
else
echo "your is running with root access"
fi

VALIDATE(){
if [ $1 -eq 0 ]
then
echo "installing mysql....SUCCESS"
else
echo "Mysql not installed...FALURE"
exit 1
fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
echo " mysql is not insatlled...going to insatll"
dnf install mysql -y
VALIDATE $? "mysql"
else
echo "mysql is already insatlalled..Nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
echo " python3 is not insatlled...going to insatll"
dnf install python3 -y
VALIDATE $? "python3"
else
echo "python3 is already insatlalled..Nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
echo " nginx is not insatlled...going to insatll"
dnf install nginx -y
VALIDATE $? "nginx"
else
echo "nginx is already insatlalled..Nothing to do"
fi