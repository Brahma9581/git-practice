#!/bin/bash

USERID=$(id -u)

echo "User id is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "please run the script with root privilages"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "git is not installed. going to install it..."
    dnf install git -y
else
    echo "git already installed, nothing to do it"
fi

dnf list installed mysql -y

if [ $? -ne 0 ]
then
    echo "mysql is not instlled, going to install it..."
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Mysql install is failed...please check it."
        exit 1
    else
        echo "Mysql installlation is success"
    fi
else
    echo "Mysql is already installed...nothing to do it"
fi
