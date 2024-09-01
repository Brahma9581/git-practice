#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 20 ]  # -lt, -ge, -le, -ne, -eq
then
    echo "Given number is: $NUMBER greather than 20"
else
    echo "Given number is: $NUMBER less than 20"
fi

