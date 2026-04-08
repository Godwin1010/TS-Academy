#!/bin/bash

#Declare an indexed array
fruits=("Apple" "Banana" "Mango" "Pineapple" "Grapes")

#Declare an associative array
declare -A capitals
capitals=([UK]="London" [France]="Paris" [Nigeria]="Abuja" [Japan]="Tokyo")

#Print Array Metadata (Indexed Array)
echo "Number of fruits: ${#fruits[@]}"
echo "All fruits: ${fruits[@]}"

echo "--- Fruit List ---"
# Loop to display indexed items
for i in "${!fruits[@]}"; do
    echo "Fruit $i: ${fruits[$i]}"
done

echo "--- Capitals ---"
# Loop to display associative items (Key: Value)
for country in "${!capitals[@]}"; do
    echo "The capital of $country is ${capitals[$country]}"
done

# Bonus: Add user input to append to the array
echo "--- Bonus Section ---"
read -p "Enter another fruit to add: " new_fruit
fruits+=("$new_fruit")

echo "Updated fruit list: ${fruits[@]}"

echo "New total count: ${#fruits[@]}"
