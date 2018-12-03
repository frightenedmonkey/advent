#! /usr/bin/env bash

# Run the first part of day one
echo "Finding the final frequency without dupes..."
INPUT_FILE=./input_one.txt go run ./...

# Run the second part of day one
echo "Finding the first dupe..."
INPUT_FILE=./input_one.txt FIND_DUPES="true" go run ./...
