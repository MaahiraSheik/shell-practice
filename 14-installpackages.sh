#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
  echo "ERROR: Please run with root access"
  exit 1
else
  echo "Script is running with root access"
fi

VALIDATE() {
  if [ $1 -eq 0 ]; then
    echo "$2 installation... SUCCESS"
  else
    echo "$2 installation... FAILURE"
    exit 1
  fi
}

for package in mysql python3 nginx; do
  echo "Checking if $package is installed..."
  dnf list installed $package &>/dev/null
  if [ $? -ne 0 ]; then
    echo "$package is not installed... Installing now"
    dnf install -y $package
    VALIDATE $? "$package"
  else
    echo "$package is already installed... Nothing to do"
  fi
done