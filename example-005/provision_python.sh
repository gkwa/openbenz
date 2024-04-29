#!/bin/bash

if command -v apt-get &> /dev/null
then
   apt-get update
   apt-get install -y python3 python3-pip
elif command -v dnf &> /dev/null
then
   dnf update
   dnf install -y python3 python3-pip
else
   echo "Unsupported package manager. Please install Python3 and pip3 manually."
   exit 1
fi