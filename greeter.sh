#!/bin/bash

#Ask for name and age using read -p
read -p "Enter your name: " NAME
read -p "Enter your age: " AGE

#Bonus: Validate age is a number
if [[ ! "$AGE" =~ ^[0-9]+$ ]]; then
    echo "Error: Age must be a valid number."
    exit 1
fi

#Use read -s for a "password"
echo -n "Enter a password: "
read -s PASSWORD
echo # Print a new line since read -s doesn't move to the next line

#Greet the user
echo "------------------------------------"
echo "Welcome, $NAME! You are $AGE years old."
echo "I've securely captured your password (length: ${#PASSWORD} characters)."
