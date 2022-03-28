# need to figure out:
# - copy/paste
# - MRU
nvim() {
  # increment container name if already running nvim instances
  nvim_count=$(( $(docker ps -a --filter="name=nvim*" | wc -l) - 1))
  [ "$nvim_count" -eq 0 ] && nvim_count=''

  if [[ $# -eq 0 ]]; then
    docker run --rm -it --name "nvim${nvim_count}" -v $(pwd):/home/neovim/workdir dylansm/neovim nvim
  else
    if [[ -d "$1" ]]; then
      dir="$1"
      file="$1"
    else
      dir=$(echo "$1" | sed 's|\(.*\)/.*|\1|')
      file=$(echo "$1" | sed 's:.*/::')
    fi

    if [[ $dir == "." ]] || [[ "$dir" == "$file" ]]; then
      dir=$(pwd)
    fi

    if [[ "$dir" == .* ]] || [[ "$dir" == [a-zA-Z]* ]]; then
      dir="$(pwd)/$dir"
    fi
    # echo "dir=$dir"
    # echo "file=$file"
    docker run --rm -it --name "nvim${nvim_count}" -v $(echo $dir):/home/neovim/workdir dylansm/neovim nvim "$file"
  fi
}
