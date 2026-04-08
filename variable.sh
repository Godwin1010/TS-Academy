#!/bin/bash

#Declaring variables

NAME="Godwin"
AGE=28
readonly CONSTANT=42  # Using 'readonly' makes it a true constant

#Print messages using variable expansion
echo "Hello $NAME, you are $AGE years old."
echo "The secret constant is $CONSTANT."

#Perform arithmetic
SUM=$((AGE + 10))
echo "In 10 years, you will be $SUM."

# Bonus: Parameter expansion for fallback
# If NAME was empty or unset, it would use "Default"
echo "Greetings, ${NAME:-Default}!"

