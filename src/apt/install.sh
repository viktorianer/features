#!/bin/bash

set -e

# Exit script if any command fails
set -o errexit

# Debugging (optional, comment out if not needed)
# set -x

# Use the DEV_FILE environment variable to find the Aptfile.dev
if [ -f "$DEV_FILE" ]; then
  echo "Aptfile.dev detected at $DEV_FILE. Installing dependencies..."

  apt-get update -y
  grep -Ev "^\s*#" "$DEV_FILE" | xargs apt-get install --no-install-recommends -y
  rm -rf /var/lib/apt/lists/*

  echo "Dependencies from Aptfile.dev have been installed."
else
  echo "No Aptfile.dev found at $DEV_FILE, skipping apt dependencies installation."
fi
