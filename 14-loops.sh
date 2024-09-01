#!/bin/bash

USERID=$(id -u)

#echo "User id is: $USERID"
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run the script with root privilages"
        exit 1
    fi
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed."
        exit 1
    else
        echo "$2 is success.."
    fi
}

CHECK_ROOT

for package in $@ # all arguments
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed...going to install it."
        dnf install $package -y
        VALIDATE $? "installing $package"
    else
        echo "$package is already installed...."
    fi
done