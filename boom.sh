#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Generate a random sleep duration between 0 and 1800 seconds (30 minutes)
sleep_duration=$(awk 'BEGIN{srand(); print int(rand()*1800)}')

# Sleep for the random duration
echo "Sleeping for $sleep_duration seconds"
sleep $sleep_duration

# Generate a random number between 0 and 1
random_number=$(awk 'BEGIN{srand(); print int(rand()*2)}') 
echo "$random_number"

# Check if the random number is 1 (50% chance)
if [[ $random_number == 1 ]]; then
    git --git-dir=$DIR/.git --work-tree=$DIR checkout $DIR/hash.txt
    git --git-dir=$DIR/.git --work-tree=$DIR pull
    rm $DIR/hash.txt
    RAND="$(openssl rand -base64 32)"
    printf "$RAND" >> $DIR/hash.txt
    git --git-dir=$DIR/.git --work-tree=$DIR add $DIR/hash.txt
    git --git-dir=$DIR/.git --work-tree=$DIR commit -m "$RAND commit"
    git --git-dir=$DIR/.git --work-tree=$DIR push
fi
