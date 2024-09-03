#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME/$TIME_STAMP.log"
mkdir -p $LOG_FOLDER

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
CHECK_ROOT(){
    if [ $USERID -ne 0]
    then
        echo -e "$R please run the script with root privilages $N" | tee -a $LOG_FILE 
        exit 1
    fi

}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed." | tee -a $LOG_FILE
        exit 1
    else
        echo "$2 is success.." | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sudo 15-redirectors.sh package1 package2..."
}

echo "script executing date is: $(date)"
CHECK_ROOT

if [ $# -eq 0]
then
    USAGE
fi

for package in $@ # all arguments
do
    dnf list installed $package &>>LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed...going to install it." | tee -a $LOG_FILE
        dnf install $package -y &>>LOG_FILE
        VALIDATE $? "installing $package"
    else
        echo -e "$Y $package is already installed....$N" | tee -a $LOG_FILE
    fi
done