# Shell Script Race Condition

This repository demonstrates a simple race condition in a bash shell script. Two processes increment a shared counter simultaneously, leading to an inaccurate result due to the lack of synchronization.

## Bug Description
The script `bug.sh` uses two subprocesses to increment a counter concurrently.  The lack of locking or other synchronization mechanism means that the counter value will likely be less than expected.  This is a classic example of race conditions.

## Solution
The solution, `bugSolution.sh`, uses a lock file to ensure only one process can update the counter at a time. This prevents the race condition and guarantees the correct final counter value.  This demonstrates a simple yet effective approach to handling concurrency issues in shell scripting.

## How to Run
1. Clone this repository.
2. Run `bug.sh` and observe that the final counter value is often less than expected.
3. Run `bugSolution.sh` and observe that the final counter value is correct.
