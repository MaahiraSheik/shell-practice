#!/bin/bash


USERID=$(id -u)

R="\e\31m"
G="\e\32m"
Y="\e\33m"
N="\e\0m"
 
if [ $USERID -ne 0 ]
then
echo -e "$R ERROR: please run with this root access $N"
exit 1
else
echo "your is running with root access"
fi

# VALIDATE(){
# if [ $1 -eq 0 ]
# then
# echo -e "installing mysql....$G SUCCESS $N"
# else
# echo -e "Mysql not installed...$R FALURE $N"
# exit 1
# fi
# }

VALIDATE(){
    if [ $1 -eq 0 ]; then
    echo -e "$G SUCCESS: $2 installed $N"
  else
    echo -e "$R FAILURE: $2 not installed $N"
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
echo -e  "$Y Nothing to do mysql.. already insatlalled. $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
echo " python3 is not insatlled...going to insatll"
dnf install python3 -y
VALIDATE $? "python3"
else
echo -e "$Y Nothing to do Python3..already insatlalled. $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
echo " nginx is not insatlled...going to insatll"
dnf install nginx -y
VALIDATE $? "nginx"
else
echo -e "$Y Nothing to do Nginx.. already insatlalled. $N"
fi