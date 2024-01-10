#!/bin/bash

ID=$(id -u)
VALIDATE(){

if [ $1 ne -0 ]
then 
    echo "ERROR:: $2..  FAILED"
    exit 1
else
    echo "$2.. success"

fi
}

if [ $ID -ne 0 ]
then
    echo  "ERROR:: run with root user"
    exit 11
else 
    echo " you are root user"

fi

yum install mysql -y

VALIDATE $? "installing mysql"

yum install git -y

VALIDATE $? "install git"



