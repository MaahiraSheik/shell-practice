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
echo "installing mysql $2....SUCCESS"
else
echo "Mysql not installed $2...FALURE"
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


# Perfect — let’s build a mini demo script so you can actually see what $1 and $2 hold when the function is called. This will clear up the confusion.

# 📝 Demo Script
# #!/bin/bash

# VALIDATE(){
#   echo "Inside function:"
#   echo "  First argument (\$1) = $1"
#   echo "  Second argument (\$2) = $2"

#   if [ $1 -eq 0 ]
#   then
#     echo "$2 installation SUCCESS"
#   else
#     echo "$2 installation FAILURE"
#   fi
# }

# # Simulate a successful command
# echo "Simulating success..."
# true   # always returns exit code 0
# VALIDATE $? "mysql"

# # Simulate a failed command
# echo "Simulating failure..."
# false  # always returns exit code 1
# VALIDATE $? "python3"



# 🔎 What Happens When You Run It
# - First case (success):
# - true → exit code = 0.
# - Call: VALIDATE $? "mysql".
# - Inside function:
# - $1 = 0
# - $2 = mysql
# - Output:
# Inside function:
#   First argument ($1) = 0
#   Second argument ($2) = mysql
# mysql installation SUCCESS
# - Second case (failure):
# - false → exit code = 1.
# - Call: VALIDATE $? "python3".
# - Inside function:
# - $1 = 1
# - $2 = python3
# - Output:
# Inside function:
#   First argument ($1) = 1
#   Second argument ($2) = python3
# python3 installation FAILURE



# ✅ Key Takeaway
# - $? is the exit code of the last command.
# - When you call VALIDATE $? "mysql", inside the function:
# - $1 = exit code (0 or non-zero).
# - $2 = "mysql".
# - Before calling the function, $1 has no value. It only gets filled when you pass arguments into the function.

# Would you like me to rewrite your original script using this improved VALIDATE function, so it prints the correct package name for MySQL, Python3, and Nginx automatically?
