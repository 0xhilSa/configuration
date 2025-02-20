# include these command into your existing .bashrc file

alias src=source

dd(){
  local dir=$1
  if [ -z "$dir" ]; then
    cd /mnt/d
  else
    cd /mnt/d/"$dir"
  fi
}

h(){
  local dir=$1
  if [ -z "$dir" ]; then
    cd ~
  else
    cd ~/"$dir"
  fi
}

r(){
  local dir=$1
  if [ -z "$dir" ]; then
    cd /
  else
    cd /"$dir"
  fi
}

ff(){
  local dir=$(fzf)
  [ -n "$dir" ] && vim "$dir"
}

cpy(){
  if [ -z "$1" ]; then
    echo "Usage: cpy <filename>"
    return 1
  fi

  if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    return 1
  fi

  if command -v xclip &> /dev/null; then
    cat "$1" | xclip -selection clipboard
    echo "Copied content of '$1' to clipboard (xclip)."
  elif command -v xsel &> /dev/null; then
    cat "$1" | xsel --clipboard
    echo "Copied content of '$1' to clipboard (xsel)."
  elif command -v pbcopy &> /dev/null; then
    cat "$1" | pbcopy
    echo "Copied content of '$1' to clipboard (pbcopy)."
  elif command -v clip.exe &> /dev/null; then
    cat "$1" | clip.exe
    echo "Copied content of '$1' to clipboard (Windows clip.exe)."
  else
    echo "Error: No clipboard utility found. Install xclip, xsel, pbcopy, or use WSL on Windows."
    return 1
  fi
}
