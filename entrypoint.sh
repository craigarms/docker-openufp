#!/bin/sh

# Start the first process
/usr/sbin/openufp $@
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start Openufp: $status"
  exit $status
fi

while sleep 60; do
  ps aux |grep openufp |grep -q -v grep
  PROCESS_1_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $PROCESS_1_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    exit 1
  fi
done
