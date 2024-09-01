#!/bin/bash

echo "All variables passed to the script: $@"

echo "number of variables: $#"

echo "Current directory: $PWD"

echo "Current home directory: $HOME"

echo "PID of the script executing: $$"

sleep 100 &

echo "PID of the last backgorund command: $!"

