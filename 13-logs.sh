#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/%0-$TIMESTAMP.log"

echo "script name: $0"

VALIDATE(){
    if [  $1 -ne 0 ]
    then 
        echo -e "$2 ..$R failed $N"
    else 
        echo -e "$2..SUCCESS $N"
    fi    
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: run with root user $N"
    exit 11
else 
    echo " you are root user"

fi


yum install mysql -y &>> $LOGFILE

VALIDATE $? "installing mysql"

yum install git -y &>> $LOGFILE

VALIDATE $? "install git"