#!/bin/bash

# Function to count files in current directory (excluding directories)
count_files() {
    local file_count=$(ls -l | grep '^-' | wc -l)
    echo $file_count
}

# Function to compare guess with actual count
check_guess() {
    local guess=$1
    local actual=$2
    
    if [[ $guess -lt $actual ]]; then
        echo "Too low!"
        return 1
    elif [[ $guess -gt $actual ]]; then
        echo "Too high!"
        return 1
    else
        echo "Congratulations! You guessed the correct number of files."
        return 0
    fi
}

# Main game function
play_game() {
    local actual_count=$(count_files)
    local user_guess
    local game_over=0
    
    echo "Welcome to the Guessing Game!"
    echo "=============================="
    
    while [[ $game_over -eq 0 ]]; do
        echo "How many files are in the current directory?"
        read -p "Enter your guess: " user_guess
        
        # Validate input is a number
        if ! [[ "$user_guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a valid number."
            continue
        fi
        
        check_guess $user_guess $actual_count
        if [[ $? -eq 0 ]]; then
            game_over=1
        fi
    done
}

# Start the game
play_game
