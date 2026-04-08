#!/bin/bash

#Print metadata
echo "Script Name: $0"
echo "All Arguments: $@"
echo "Argument Count: $#"

#Require exactly 2 arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: ./args.sh <name> <city>"
    exit 1
fi

#Print greeting using positional parameters
echo "Hello $1 from $2!"

echo "Processing all arguments one by one:"

while [ "$#" -gt 0 ]; do
    echo "Current Argument: $1"
    shift
done
