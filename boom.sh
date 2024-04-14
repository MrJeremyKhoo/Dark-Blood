#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Generate a random number between 0 and 1
random_number=$(openssl rand -base64 32 | awk '{print $1 % 2}')

# Check if the random number is 0 (50% chance)
if [[ $random_number == 0 ]]; then
    git --git-dir=$DIR/.git --work-tree=$DIR checkout $DIR/hash.txt
    git --git-dir=$DIR/.git --work-tree=$DIR pull
    rm $DIR/hash.txt
    RAND="$(openssl rand -base64 32)"
    printf "$RAND" >> $DIR/hash.txt
    git --git-dir=$DIR/.git --work-tree=$DIR add $DIR/hash.txt
    git --git-dir=$DIR/.git --work-tree=$DIR commit -m "$RAND commit"
    git --git-dir=$DIR/.git --work-tree=$DIR push
fi
