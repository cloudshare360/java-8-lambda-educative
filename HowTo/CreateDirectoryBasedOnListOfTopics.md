Here’s the **updated script** that ensures an **empty target directory** falls back to the **current directory** (`.`).

---

### ✅ **Enhanced Script: `manage_directories.sh`**

```bash
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
        mkdir -p "$dir_name"
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
```

---

### 🧪 **How to Use the Script**

#### ✅ Create Directories
- **Default (current directory)**:
  ```bash
  ./manage_directories.sh create
  ```
- **Custom directory**:
  ```bash
  ./manage_directories.sh create /path/to/target
  ```
- **Empty target directory (falls back to current)**:
  ```bash
  ./manage_directories.sh create ""
  ```

#### 🗑️ Delete Directories
- **Default (current directory)**:
  ```bash
  ./manage_directories.sh delete
  ```
- **Custom directory**:
  ```bash
  ./manage_directories.sh delete /path/to/target
  ```
- **Empty target directory (falls back to current)**:
  ```bash
  ./manage_directories.sh delete ""
  ```

---

### 📌 **Key Improvements**
- **Fallback Logic**: If the `target_dir` is an empty string (`""`), it defaults to the current directory (`.`).
- **Safety Checks**:
  - Ensures the target directory exists before deletion.
  - Validates the input action (`create` or `delete`).
- **Robustness**:
  - Handles edge cases like empty paths gracefully.
  - Preserves folder names with spaces and special characters.

---

### 🛠️ **Example Usage**
```bash
# Create folders in ~/Documents/Java8Modules
./manage_directories.sh create ~/Documents/Java8Modules

# Delete folders from the same directory
./manage_directories.sh delete ~/Documents/Java8Modules

# Create folders in current directory (empty path)
./manage_directories.sh create ""

# Delete folders from current directory (empty path)
./manage_directories.sh delete ""
```

---

### 🚨 **Important Notes**
- **Irreversible Deletion**: Deleted directories cannot be recovered unless backed up.
- **Dry Run (Optional)**: To simulate deletion, replace `rm -r "$dir_name"` with `echo rm -r "$dir_name"` in the `delete_directories` function.

Let me know if you’d like features like **confirmation prompts**, **logging**, or **dynamic item lists**! 🚀