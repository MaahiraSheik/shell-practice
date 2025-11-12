#!/bin/bash

echo "All variables passed to the script: $@"

echo "number of variables passed to the script: $#"
echo "script name: $0"
echo "current directory: $PWD"
echo "user running this script: $USER"
ECHO "Home directory of the user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"