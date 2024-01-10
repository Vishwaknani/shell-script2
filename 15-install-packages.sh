#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executes at $TIMESTAMP" &>> LOGFILE

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
    echo "you are root user"

fi
echo "All arguments passed $@"

# echo  all arguments passed: $@"
# git mysql postfix net-tools
for package in $@
do
    yum list installed $package &>> LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> LOGFILE
        VALIDATE $? "Installation of $package"
    
    else
        echo -e "$package is already installed...$Y SKIPPED $N"
    
fi

done