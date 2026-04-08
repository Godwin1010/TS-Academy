#!/bin/bash

#Accept a filename as an argument
FILE=$1

if [[ -z "$FILE" ]]; then
    echo "Error: Please provide a filename as an argument."
    echo "Usage: $0 <filename>"
    exit 1
fi

#Check file type and status
echo "--- File Analysis ---"
if [[ -d "$FILE" ]]; then
    echo "'$FILE' is a directory."
elif [[ -f "$FILE" ]]; then
    echo "'$FILE' is a regular file."
    
    # Bonus: Nested Permission Checks
    echo -n "Permissions: "
    [[ -r "$FILE" ]] && echo -n "Read "
    [[ -w "$FILE" ]] && echo -n "Write "
    [[ -x "$FILE" ]] && echo -n "Execute"
    echo "" # New line
else
    echo "Path '$FILE' does not exist or is a special file type."
fi

echo "--- Priority Check ---"

#Case statement for number input
read -p "Enter a priority level (1-3): " LEVEL
case $LEVEL in
    1)
        echo "Priority: Low"
        ;;
    2)
        echo "Priority: Medium"
        ;;
    3)
        echo "Priority: High"
        ;;
    *)
        echo "Invalid input. Please enter 1, 2, or 3."
        ;;
esac

echo "--- Age Verification ---"

#Age check
read -p "Enter your age: " AGE
if [[ "$AGE" -lt 18 ]]; then
    echo "Status: Minor"
else
    echo "Status: Adult"
fi
