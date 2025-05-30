#!/bin/bash

# Set target directory (default: current)
if [ $# -eq 0 ]; then
    target_dir="."
else
    target_dir="$1"
    mkdir -p "$target_dir"  # Create if not exists
fi

# Move into target directory
cd "$target_dir" || { echo "Failed to enter $target_dir"; exit 1; }

# List of items
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

# Loop through the list and create directories
for i in "${!items[@]}"; do
    formatted_num=$(printf "%02d" $((i + 1)))
    dir_name="${formatted_num}-${items[$i]}"
    
    mkdir -p "$dir_name"
    echo "Created directory: $target_dir/$dir_name"
done