#!/bin/bash

USERID=$(id -u)

#echo "User id is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed."
        exit 1
    else
        echo "$2 is success.."
    fi
}

if [ $USERID -ne 0 ]
then
    echo "please run the script with root privilages"
    exit 1
fi

dnf list installed git
#VALIDATE $? "listing git"

if [ $? -ne 0 ]
then
    echo "git is not installed. going to install it..."
    dnf install git -y
    VALIDATE $? "installing git"
else
    echo "git already installed, nothing to do it"
fi

dnf list installed mysql -y

if [ $? -ne 0 ]
then
    echo "mysql is not instlled, going to install it..."
    dnf install mysql -y
    VALIDATE $? "installing MYSQL"
else
    echo "Mysql is already installed...nothing to do it"
fi
