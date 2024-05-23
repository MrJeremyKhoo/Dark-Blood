#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#Random number whether to commit or not
random_number=$(awk 'BEGIN{srand(); print int(rand()*10)}') 

if [[ $random_number <= 8 ]]; then
# Generate a random sleep duration between 0 and 1800 seconds (30 minutes)
sleep_duration=$(awk 'BEGIN{srand(); print int(rand()*900)}')
echo "Sleeping for $sleep_duration seconds"

sleep $sleep_duration

# Generate a random number between 0 and 1

# Check if the random number is 1 (50% chance)
    git --git-dir=$DIR/.git --work-tree=$DIR checkout $DIR/hash.txt
    git --git-dir=$DIR/.git --work-tree=$DIR pull
    rm $DIR/hash.txt
    RAND="$(openssl rand -base64 32)"
    printf "$RAND" >> $DIR/hash.txt
    git --git-dir=$DIR/.git --work-tree=$DIR add $DIR/hash.txt
    git --git-dir=$DIR/.git --work-tree=$DIR commit -m "$RAND commit"
    git --git-dir=$DIR/.git --work-tree=$DIR push
fi
