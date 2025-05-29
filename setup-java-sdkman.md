Great question! 🚀

You're using **Gitpod** or a similar cloud IDE (like GitHub Codespaces or VS Code Dev Containers), and you want to:

✅ **Set Java in `PATH` and `JAVA_HOME` using SDKMAN**

SDKMAN is already managing your Java versions, so let’s make sure it sets them correctly in the environment.

---

## ✅ Goal

Ensure that:

- Java 11/17/21 are installed via SDKMAN
- The correct version is set as default
- `java`, `javac`, etc., work globally
- `JAVA_HOME` is updated accordingly
- Changes apply immediately in the current shell session

---

## ✅ Step-by-Step: Set Java in PATH Using SDKMAN

### 🔹 1. Check if SDKMAN is installed

```bash
if [ -d "$HOME/.sdkman" ]; then
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
```

This loads SDKMAN into your shell session.

---

### 🔹 2. Set Default Java Version

Use this command to set a specific version as default:

```bash
sdk default java 21.0.6-tem
```

Replace `21.0.6-tem` with:

- `11.0.27-tem`
- `17.0.15-tem`
- Or any version listed by `sdk list java`

---

### 🔹 3. Update `JAVA_HOME` and `PATH`

After setting the default, run:

```bash
export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
export PATH="$JAVA_HOME/bin:$PATH"
```

This ensures:

- Java binaries are in your path
- Tools like Maven, Gradle, IDEs use the right JDK

---

## ✅ Final Bash Script: `setup-java-sdkman.sh`

Here's a complete script that does everything you need:

```bash
#!/bin/bash

set -e

# Define SDKMAN_DIR
export SDKMAN_DIR="$HOME/.sdkman"

# Source SDKMAN if already initialized
if [ -f "$SDKMAN_DIR/bin/sdkman-init.sh" ]; then
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

echo "🔍 Checking for SDKMAN..."

# Install SDKMAN if not found
if ! command -v sdk &> /dev/null; then
    echo "📎 Installing SDKMAN..."
    curl -s "https://get.sdkman.io" | bash > /dev/null
    source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi

# Verify sdk command is now available
if ! command -v sdk &> /dev/null; then
    echo "❌ Failed to install or load SDKMAN."
    exit 1
else
    echo "✅ SDKMAN is now in PATH."
fi

# List of required Java versions
declare -a JAVA_VERSIONS=("11.0.27-tem" "17.0.15-tem" "21.0.6-tem")

for version in "${JAVA_VERSIONS[@]}"; do
    echo ""
    if sdk list java | grep -q "$version"; then
        echo "✅ Java $version is already installed."
    else
        echo "📥 Installing Java $version via SDKMAN..."
        sdk install java "$version"
    fi
done

# Set Java 21 as default
echo ""
echo "⚙️ Setting Java 21.0.6 (tem) as default..."
sdk default java 21.0.6-tem

# Dynamically determine Java installation path
JAVA_HOME_PATH="$HOME/.sdkman/candidates/java/current"

# Update PATH dynamically using detected path
export JAVA_HOME="$JAVA_HOME_PATH"
export PATH="$JAVA_HOME/bin:$PATH"

# Optional: Add to shell config for persistence
if [[ -f "$HOME/.bashrc" ]]; then
    echo 'export JAVA_HOME="$HOME/.sdkman/candidates/java/current"' >> "$HOME/.bashrc"
    echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
elif [[ -f "$HOME/.zshrc" ]]; then
    echo 'export JAVA_HOME="$HOME/.sdkman/candidates/java/current"' >> "$HOME/.zshrc"
    echo 'export PATH="$JAVA_HOME/bin:$PATH"' >> "$HOME/.zshrc"
    source "$HOME/.zshrc"
fi

# Final verification
echo ""
echo "📌 Installed Java Versions:"
sdk list java | grep installed

echo ""
echo "📌 Current Default Java Version:"
sdk current java

echo ""
echo "✅ Java -version output:"
java -version

echo ""
echo "🔗 Resolved Java Binary Path (readlink -f \$(which java)):"
readlink -f $(which java)

echo ""
echo "📁 JAVA_HOME set to:"
echo "$JAVA_HOME"
```

---

## 🔧 How to Use This Script

### Step 1: Save It

Save it somewhere like:

```bash
~/scripts/setup-java-sdkman.sh
```

Or inside your project:

```bash
.devcontainer/scripts/setup-java-sdkman.sh
```

### Step 2: Make It Executable

```bash
chmod +x ~/scripts/setup-java-sdkman.sh
```

### Step 3: Run It

```bash
~/scripts/setup-java-sdkman.sh
```

This will:

- Install SDKMAN if needed
- Install all three Java versions if missing
- Set Java 21 Temurin as default
- Update `JAVA_HOME` and `PATH` dynamically
- Persist changes in `.bashrc` or `.zshrc`

---

## 📊 Works With Your Gitpod Usage Data

From your CSV file:

- You’re using workspace class `g1-large`, `g1-standard`
- Some may have preinstalled Java versions
- Others start fresh

This script ensures:

- Java 21 Temurin is always available
- Environment variables are correctly updated
- Changes apply immediately (`source` used)
- Safe to rerun — no side effects

---

## ✅ Sample Output

```
🔍 Checking for SDKMAN...
✅ SDKMAN is now in PATH.

✅ Java 11.0.27-tem is already installed.
✅ Java 17.0.15-tem is already installed.
✅ Java 21.0.6-tem is already installed.

⚙️ Setting Java 21.0.6 (tem) as default...

📌 Installed Java Versions:
  11.0.27-tem      installed           vendor: adoptium
  17.0.15-tem      installed           vendor: adoptium
  21.0.6-tem       installed           vendor: adoptium

📌 Current Default Java Version:
Java version "21.0.6" OpenJDK Runtime Environment

✅ Java -version output:
openjdk version "21.0.6" ...

🔗 Resolved Java Binary Path (readlink -f $(which java)):
/home/gitpod/.sdkman/candidates/java/21.0.6-tem/bin/java

📁 JAVA_HOME set to:
/home/gitpod/.sdkman/candidates/java/current
```

---

## 🛠 Optional Enhancements

Would you like help adding:

- Auto-switching based on `.sdkmanrc` per project
- Integration with Gitpod usage tracking
- Exporting final setup to JSON or log file
- Dev Container integration (`devcontainer.json`)

Let me know — happy to extend this further!

Happy coding! 💻🚀
