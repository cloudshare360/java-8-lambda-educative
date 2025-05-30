#!/bin/bash

# -------------------------------
# Helper Function: Create Folders
# -------------------------------
create_directories() {
    local target_dir="$1"
    mkdir -p "$target_dir"
    cd "$target_dir" || { echo "Failed to enter $target_dir"; exit 1; }

    local items=(
        "Introduction"
        "Filtering-Operations-in-Stream"
        "Mapping-Operations-in-Stream"
        "Method-References"
        "Optional-in-Java-8-Part-1"
        "Optional-in-Java-8-Part-2"
        "Slicing-Operations-in-Stream"
        "Matching-Operations-in-Stream"
        "Finding-Operations-in-Stream"
        "Mutable-Reduction-Through-reduce"
        "Collectors-Collection-Operations"
        "Collectors-Aggregation-Operations"
        "Collectors-Grouping-Operations"
        "Parallel-Stream"
        "Lazy-Evaluation-in-Streams"
    )

    for i in "${!items[@]}"; do
        local formatted_num=$(printf "%02d" $((i + 1)))
        local dir_name="${formatted_num}-${items[$i]}"
        mkdir -p "$dir_name"

        # Create README.md inside each directory
        echo "# README - ${dir_name}" > "$dir_name/README.md"

        echo "Created directory: $target_dir/$dir_name"
    done
}

# -------------------------------
# Helper Function: Delete Folders
# -------------------------------
delete_directories() {
    local target_dir="$1"

    if [ ! -d "$target_dir" ]; then
        echo "Directory not found: $target_dir"
        exit 1
    fi

    cd "$target_dir" || { echo "Failed to enter $target_dir"; exit 1; }

    local items=(
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

    for i in "${!items[@]}"; do
        local formatted_num=$(printf "%02d" $((i + 1)))
        local dir_name="${formatted_num}-${items[$i]}"
        if [ -d "$dir_name" ]; then
            rm -r "$dir_name"
            echo "Deleted directory: $target_dir/$dir_name"
        else
            echo "Directory not found: $target_dir/$dir_name"
        fi
    done
}

# -------------------------------
# Main Script Logic
# -------------------------------

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 create [target_dir]"
    echo "   or: $0 delete [target_dir]"
    exit 1
fi

# Parse action
action="$1"

# Set target directory (default: current)
if [ $# -ge 2 ]; then
    target_dir="$2"
    # If target_dir is empty, fallback to current directory
    if [ -z "$target_dir" ]; then
        target_dir="."
    fi
else
    target_dir="."
fi

# Execute based on action
case "$action" in
    create)
        create_directories "$target_dir"
        ;;
    delete)
        delete_directories "$target_dir"
        ;;
    *)
        echo "Invalid action: $action"
        echo "Usage: $0 create [target_dir]"
        echo "   or: $0 delete [target_dir]"
        exit 1
        ;;
esac