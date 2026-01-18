#!/bin/bash

# Function to count files in current directory
file_count() {
    echo $(ls -1 | wc -l)
}

# Main game function
game() {
    local answer=$(file_count)
    local guess
    
    echo "Welcome to the Guessing Game!"
    
    while true; do
        echo "How many files are in the current directory?"
        read guess
        
        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a valid number."
            continue
        fi
        
        if [ $guess -lt $answer ]; then
            echo "Too low!"
        elif [ $guess -gt $answer ]; then
            echo "Too high!"
        else
            echo "Congratulations! You guessed correctly!"
            break
        fi
    done
}

# Start the game
game
