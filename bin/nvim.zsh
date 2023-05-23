# need to figure out:
# - copy/paste
# - MRU

ARCH=`uname -a`
ARM64="ARM64"

if [[ "$ARCH" =~ "$ARM64" ]]; then
  neovim_container="dylansm/neovim"
else
  # Intel
  neovim_container="dylansm/neovim:intel"
fi

      #-v /Users/dylan/.local/nvim/shada:/home/neovim/.local/share/nvim/shada \

nvim() {
  # increment container name if already running nvim instances
  nvim_count=$(( $(docker ps -a --filter="name=nvim*" | wc -l) - 1))
  [ "$nvim_count" -eq 0 ] && nvim_count=''

  if [[ $# -eq 0 ]]; then
    docker run --rm -it --name "nvim${nvim_count}" \
      -v $(pwd):/home/neovim/workdir \
      -v /Users/dylan/.config/github-copilot/hosts.json:/home/neovim/.config/github-copilot/hosts.json \
      "${neovim_container}" nvim
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
    docker run --rm -it --name "nvim${nvim_count}" \
      -v $(echo $dir):/home/neovim/workdir \
      -v /Users/dylan/.config/github-copilot/hosts.json:/home/neovim/.config/github-copilot/hosts.json \
      "${neovim_container}" nvim "$file"
  fi
}

nvim-sh() {
  docker run --rm -it --name "neovim-sh" -v $(pwd):/home/neovim/workdir "${neovim_container}" sh
}
