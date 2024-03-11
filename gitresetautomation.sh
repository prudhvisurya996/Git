#!/bin/bash

git log --since="2023-03-11 21:40:00" --until="2024-03-11 21:50:00"

# Get the commit IDs from git log
commit_ids=$(git log --since="2023-03-11 21:40:00" --until="2024-03-11 21:50:00" --format="%h")

# Display the commit IDs
echo "Choose a commit to reset to:"

# Iterate over the commit IDs and display them
echo "$commit_ids" | while read -r commit_id; do
    echo "$commit_id"
done

# Prompt user to choose a commit
read -p "Enter the commit ID to reset to: " commit

# Prompt user to choose the type of reset
read -p "Enter the type of reset to be done (soft/mixed/hard): " resettype

# Perform git reset
if [ "$resettype" == "soft" ]; then
    git reset --soft "$commit"
elif [ "$resettype" == "mixed" ]; then 
     git reset --mixed "$commit"
elif [ "$resettype" == "hard" ]; then 
     git reset --hard "$commit"
else 
    echo "Enter values 'soft', 'mixed', or 'hard'"
fi 

# Optionally, you can display the status after the reset
git status
