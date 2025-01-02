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

