#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR: please run with this root access"
exit 1
else
echo "your is running with root access"
fi
VALIDATE($1 -eq 0){
echo "installing mysql....SUCCESS"
else
echo "Mysql not installed...FALURE"
exit 1

}
dnf list installed mysql
if [ $? -ne 0 ]
then 
echo " mysql is not insatlled...going to insatll"
dnf install mysql -y
VALIDATE $? "Mysql"
else
echo "mysql is already insatlalled..Nothing to do"
fi

dnf list installed Python3
if [ $? -ne 0 ]
then 
echo " Python3 is not insatlled...going to insatll"
dnf install Python3 -y
VALIDATE $? "Python3"
else
echo "Python3 is already insatlalled..Nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
echo " nginx is not insatlled...going to insatll"
dnf install mysql -y
VALIDATE $? "nginx"
else
echo "nginx is already insatlalled..Nothing to do"
fi