#!/bin/bash

service="nginx"
read -p "Do you want to check the status?(y/n): " choice

if [ "$choice" = "y" ]; then
    if systemctl is-active "$service" > /dev/null; then
        echo "$service is active"
    else
        echo "$service is not active"
    fi
elif [ "$choice" = "n" ]; then
    echo "Skipped.."
fi
