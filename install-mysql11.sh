#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo  "ERROR:: run with root user"
    exit 11
else 
    echo " you are root user"

fi

yum install mysql -y

if [ $? ne -0 ]
then 
    echo "ERROR:: installing MYSQL FAILED"
    exit 1
else
    echo "installing mysql success"

fi

yum install git -y

if [ $? ne -0 ]
then 
    echo "ERROR:: installing GIT  FAILED"
    exit 1
else
    echo "installing GIT success"

fi
