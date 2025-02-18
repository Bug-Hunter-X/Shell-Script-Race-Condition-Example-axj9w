#!/bin/bash

# This script demonstrates a solution to the race condition using a lock file.

counter=0
lockfile="counter.lock"

# Function to atomically increment the counter
increment_counter() {
  while ! flock -n "$lockfile"; do
    sleep 0.1
  done
  let counter+=1
  flock -u "$lockfile"
}

# Process 1
( 
  while true; do 
    increment_counter
    sleep 0.1 
  done 
) & 
PID1=$!

# Process 2
( 
  while true; do 
    increment_counter
    sleep 0.1 
  done 
) & 
PID2=$!

# Let the processes run for 5 seconds
sleep 5

# Kill both processes
kill $PID1 $PID2

# Print the final counter value
echo "Final counter value: $counter"
#Remove the lockfile
rm -f "$lockfile"