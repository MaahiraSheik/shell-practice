#!/bin/bash


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NMAE.log"
mkdir -p $LOGS_FOLDER

echo "script started executing at: $(date)" &>>$LOG_FILE
 
if [ $USERID -ne 0 ]
then
echo -e "$R ERROR: please run with this root access $N"  &>>$LOG_FILE
exit 1
else
echo "your is running with root access"  &>>$LOG_FILE
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
    echo -e "$G SUCCESS: $2 installed $N"  &>>$LOG_FILE
  else
    echo -e "$R FAILURE: $2 not installed $N"  &>>$LOG_FILE
    exit 1
  fi

}

dnf list installed mysql  &>>$LOG_FILE
if [ $? -ne 0 ]
then 
echo " mysql is not insatlled...going to insatll"  &>>$LOG_FILE
dnf install mysql -y  &>>$LOG_FILE
VALIDATE $? "mysql"
else
echo -e  "$Y Nothing to do mysql.. already insatlalled. $N"  &>>$LOG_FILE
fi

dnf list installed python3  &>>$LOG_FILE
if [ $? -ne 0 ]
then 
echo " python3 is not insatlled...going to insatll"  &>>$LOG_FILE
dnf install python3 -y  &>>$LOG_FILE
VALIDATE $? "python3"
else
echo -e "$Y Nothing to do Python3..already insatlalled. $N"  &>>$LOG_FILE
fi

dnf list installed nginx  &>>$LOG_FILE
if [ $? -ne 0 ]
then 
echo " nginx is not insatlled...going to insatll"  &>>$LOG_FILE
dnf install nginx -y  &>>$LOG_FILE
VALIDATE $? "nginx"
else
echo -e "$Y Nothing to do Nginx.. already insatlalled. $N"  &>>$LOG_FILE
fi