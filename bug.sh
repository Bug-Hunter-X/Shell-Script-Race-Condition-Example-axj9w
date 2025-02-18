#!/bin/bash

# This script demonstrates a race condition in shell scripting.
# Two processes try to increment a counter simultaneously.

counter=0

# Process 1
( 
  while true; do 
    let counter+=1 
    sleep 0.1 
  done 
) & 
PID1=$!

# Process 2
( 
  while true; do 
    let counter+=1 
    sleep 0.1 
  done 
) & 
PID2=$!

# Let the processes run for 5 seconds
sleep 5

# Kill both processes
kill $PID1 $PID2

# Print the final counter value. It will likely be less than 100
echo "Final counter value: $counter"