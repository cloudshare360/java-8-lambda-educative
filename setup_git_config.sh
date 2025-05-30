#!/bin/bash

# -------------------------------
# Git Global Config Setup Script
# -------------------------------

# Set your desired global Git username and email
GIT_USER_NAME="CloudShare360"
GIT_USER_EMAIL="cloud.share360@gmail.com"

# Configure global user name and email
git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"

# Optional: Confirm the configuration
echo "Git global config updated:"
echo "User Name: $GIT_USER_NAME"
echo "User Email: $GIT_USER_EMAIL"