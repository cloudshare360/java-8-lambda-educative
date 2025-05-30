#!/bin/bash

# Set target directory (default: current)
if [ $# -eq 0 ]; then
    target_dir="."
else
    target_dir="$1"
    if [ ! -d "$target_dir" ]; then
        echo "Directory not found: $target_dir"
        exit 1
    fi
fi

# Move into target directory
cd "$target_dir" || { echo "Failed to enter $target_dir"; exit 1; }

# List of items (same as create script)
items=(
    "Introduction"
    "Filtering Operations in Stream"
    "Mapping Operations in Stream"
    "Method References"
    "Optional in Java 8: Part 1"
    "Optional in Java 8: Part 2"
    "Slicing Operations in Stream"
    "Matching Operations in Stream"
    "Finding Operations in Stream"
    "Mutable Reduction Through reduce()"
    "Collectors: Collection Operations"
    "Collectors: Aggregation Operations"
    "Collectors: Grouping Operations"
    "Parallel Stream"
    "Lazy Evaluation in Streams"
)

# Loop through the list and delete directories
for i in "${!items[@]}"; do
    formatted_num=$(printf "%02d" $((i + 1)))
    dir_name="${formatted_num}-${items[$i]}"
    
    if [ -d "$dir_name" ]; then
        rm -r "$dir_name"
        echo "Deleted directory: $target_dir/$dir_name"
    else
        echo "Directory not found: $target_dir/$dir_name"
    fi
done