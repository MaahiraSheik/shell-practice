#!/bin/bash

set -x #debug mode
df -h

free -g

nproc

systeminfo | grep "Total Physical Memory"

echo $NUMBER_OF_PROCESSORnproic

