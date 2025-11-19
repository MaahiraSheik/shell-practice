#!/bin/bash


USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER

echo "script started executing at: $(date)" &>>$LOG_FILE


 
if [ $USERID -ne 0 ]
then
echo -e "$R ERROR: please run with this root access $N" | tee -a $LOG_FILE
exit 1
else
echo "your is running with root access"  | tee -a $LOG_FILE
fi

PACKAGES=("mysql" "nginx" "python3")

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
    echo -e "$G SUCCESS: $2 installed $N"  | tee -a $LOG_FILE
  else
    echo -e "$R FAILURE: $2 not installed $N"  | tee -a $LOG_FILE
    exit 1
  fi

}

for package in ${PACKAGES[@]}
do
 dnf list installed $package  &>>$LOG_FILE
if [ $? -ne 0 ]
then 
echo " $package is not insatlled...going to insatll"  | tee -a $LOG_FILE
dnf install $package -y  &>>$LOG_FILE
VALIDATE $? "$package"
else
echo -e  "$Y Nothing to do $package.. already insatlalled. $N" | tee -a $LOG_FILE
fi

done

