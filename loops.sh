
#!/bin/bash

#For loop: 1-10, skip multiples of 3
echo "--- For Loop (Skip multiples of 3) ---"
for i in {1..10}; do
    if (( i % 3 == 0 )); then
        continue
    fi
    echo "Number: $i"
done

#While loop: Countdown
echo -e "\n--- While Loop (Countdown) ---"
read -p "Enter a number to start the countdown: " COUNT
while [ "$COUNT" -gt 0 ]; do
    echo "T-minus $COUNT..."
    ((COUNT--))
    sleep 0.5 # Optional: adds a half-second delay for effect
done
echo "Blast off!"

#Select: Simple Menu
echo -e "\n--- Select Menu ---"
PS3="Choose an option (1-3): " # Sets the prompt for 'select'
select opt in "Hello" "Date" "Exit"; do
    case $opt in
        "Hello")
            echo "Hello there!"
            ;;
        "Date")
            date
            ;;
        "Exit")
            echo "Goodbye!"
            break # Exits the select loop
            ;;
        *)
            echo "Invalid option $REPLY"
            ;;
    esac
done

#Bonus: Read a file line-by-line
echo -e "\n--- Bonus: Reading Names ---"

#Creating a temporary names file for the demonstration
echo -e "Alice\nBob\nCharlie\nDavid" > names.txt

if [[ -f names.txt ]]; then
    while IFS= read -r line; do
        echo "Processing Name: $line"
    done < names.txt
else
    echo "File names.txt not found."
fi
