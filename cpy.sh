#!/bin/bash

# check if a file name is provided
if [ -z "$1" ]; then
  echo "Usage: cpy <filename>"
  exit 1
fi

# check if the file exists
if [ ! -f "$1" ]; then
  echo "Error: File '$1' not found."
  exit 1
fi

# detect OS and use appropriate clipboard command
if command -v xclip &> /dev/null; then
  cat "$1" | xclip -selection clipboard
  echo "copied content of '$1' to clipboard (xclip)."
elif command -v xsel &> /dev/null; then
  cat "$1" | xsel --clipboard
  echo "copied content of '$1' to clipboard (xsel)."
elif command -v pbcopy &> /dev/null; then
  cat "$1" | pbcopy
  echo "copied content of '$1' to clipboard (pbcopy)."
elif command -v clip.exe &> /dev/null; then
  cat "$1" | clip.exe
  echo "copied content of '$1' to clipboard (Windows clip.exe)."\else
  echo "error: No clipboard utility found. Install xclip, xsel, pbcopy, or use WSL on Windows."
  exit 1
fi
