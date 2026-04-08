#!/bin/bash

#Strict Mode: Exit on error (-e), unset variables (-u), and pipe failures (-o pipefail)
set -euo pipefail

# Bonus: Trap for cleanup. This runs even if the script crashes.
cleanup() {
    echo "Cleaning up temporary files..."
    rm -f temp_list.txt
}
trap cleanup EXIT

#Redirecting output for the following block
# > output.log (stdout) and 2> errors.log (stderr)
{
    echo "--- System Check ---"
    date
    
    # Chaining commands with pipes
    echo "Counting shell scripts in current directory:"
    ls -l | grep ".sh" | wc -l
    
    # Intentionally cause an error (trying to list a non-existent file)
    ls non_existent_file.txt

} > output.log 2> errors.log

#Debugging with set -x
echo "Entering debug mode to check variable assignment..."
set -x
DEBUG_VAR="Trace active"

#This will cause an error because of 'set -u' if the variable was misspelled
echo "The value is: $DEBUG_VAR"
set +x # Turn off debug mode

echo "Script finished successfully (or did it?)"

