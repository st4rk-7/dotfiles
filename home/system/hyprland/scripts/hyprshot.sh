#!/bin/sh

# Default mode is region
CAPTURE_MODE="region"

# Check if a mode argument is provided
if [ -n "$1" ]; then
  if [ "$1" = "monitor" ]; then
    CAPTURE_MODE="output" # hyprshot uses 'output' for current monitor
  elif [ "$1" = "region" ]; then
    CAPTURE_MODE="region"
  else
    echo "Invalid mode: $1. Use 'region' or 'monitor'."
    exit 1
  fi
fi

# Define the base directory for screenshots
SCREENSHOT_DIR_BASE="$HOME/Pictures/Screenshots"

# Create the year-month subdirectory (e.g., /home/jess/Pictures/Screenshots/2025-06)
SUB_DIR="$SCREENSHOT_DIR_BASE/$(date +%Y-%m)"
mkdir -p "$SUB_DIR"

# Define the filename format (e.g., Screenshot_14-30-55.png or Monitor_14-30-55.png)
FILENAME_PREFIX="Screenshot"
if [ "$CAPTURE_MODE" = "output" ]; then
  FILENAME_PREFIX="Monitor"
fi
FILENAME="${FILENAME_PREFIX}_$(date +%H-%M-%S).png"

# Run hyprshot
hyprshot -m "$CAPTURE_MODE" -o "$SUB_DIR" -f "$FILENAME"