# include these command into your existing .bashrc file

export TERM=xterm-256color

alias src=source
alias cls=clear
alias python=python3
alias py=python3
alias ipython=ipython3
alias ipy=ipython3
alias duh="du -h --max-depth=1"
alias as=arm-linux-gnueabi-as
alias as-gcc=arm-linux-gnueabi-gcc
alias tls='tmux list-session'

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

ffind(){
  find . -type f -iname "*$1*"
}

extract(){
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xvjf "$1" ;;
      *.tar.gz) tar xvzf "$1" ;;
      *.bz2) tar bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xvf "$1" ;;
      *.tbz2) tar xvjf "$1" ;;
      *.tgz) tar xvzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.Z) ncompress "$1" ;;
      *.7z) 7z x "$1" ;;
      *) echo "Cannot extract: Unknown format" ;;
    esac
  else
    echo "Usage: extract <file>"
  fi
}

bak(){
  local src=$1
  local dst="${src}_backup_$(date +"%Y%m%d%H%M%S")"
  cp -r "$src" "$dst"
  echo "backup created: $dst"
}

ip(){
  echo "$(curl -s https://ipinfo.io/ip)"
}

sysinfo() {
  echo "Hostname: $(hostname)"
  echo "Uptime: $(uptime -p)"
  echo "Memory Usage: $(free -h | awk '/Mem:/ {print $3 "/" $2}')"
  echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 "/" $2}')"
  echo "CPU Load: $(uptime | awk -F'load average: ' '{print $2}')"
  echo "Arch: $(uname -p)"
  echo "OS: $(uname -o)"
  echo "Kernel Version: $(uname -v)"
}

gs(){
  git status
}

gl(){
  git log
}

gd(){
  git diff "$@"
}

ga(){
  git add "$@"
}

gc(){
  git commit -m "$*"
}

gp(){
  local remote="${1:-org}"
  local branch="${2:-master}"
  git push -u "$remote" "$branch"
}

tkill(){
  if ! tmux list-session &>/dev/null; then
    echo "No active TMUX session found!"
    return
  fi

  if [ -n "$1" ]; then
    tmux kill-session -t "$1"
  else
    read -p "Are you sure you want to kill ALL tmux sessions? (y/N): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      tmux kill-server
    else
      echo "Operation canceled."
    fi
  fi
}

tas(){
  tmux attach-session -t "$1"
}

tns(){
  if [ -z "$1" ]; then
    tmux new-session
    return
  fi
  if tmux has-session -t "$1" 2>/dev/null; then
    echo "ERROR: session '$1' already exist"
  else
    tmux new-session -s "$1"
  fi
}
