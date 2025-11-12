#!/bin/bash

USERID=$(id -u)

if($USERID -ne 0) then
echo "ERROR: You can run with root access"
else
echo "User is running with root access"
fi