#!/bin/bash

read -p "Enter a number: " number

if [ $number -gt 0 ]; then
    echo "The number is postive."
elif [ $number -lt 0 ]; then
    echo "The number is negative."
else
    echo "The number is zero."
fi
