FROM node:17.7.2-alpine3.15

ENV UID=1000 GID=1000 UNAME=neovim GNAME=neovim SHELL=/bin/bash NVIM_CONFIG=/home/neovim/.config/nvim

WORKDIR /home/neovim

COPY ./config .config

RUN apk --no-cache add curl shadow sudo su-exec python3 py3-pip neovim fzf \
  bash python3-dev git build-base gcc musl-dev ctags \
  && apk add the_silver_searcher --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
  && addgroup "${GNAME}"  \
  && adduser -D -G "${GNAME}" -g "" -s "${SHELL}" "${UNAME}"  \
  && echo "${UNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers  \
  && sudo -u neovim pip3 install pynvim  \
  && apk del build-base gcc musl-dev  \
  && chown -R neovim:neovim /home/neovim/.local

WORKDIR /home/neovim/.config/nvim/autoload

COPY coc-settings.json /home/neovim/.config/nvim

RUN curl -fLO https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  \
  && mkdir -p "/home/neovim/.config/coc/extensions"  \
  && chown -R neovim:neovim /home/neovim/.config \
  && chown -R neovim:neovim /home/neovim/.config/nvim/coc-settings.json

USER neovim

WORKDIR /.config/coc/extensions

RUN if [ ! -f package.json ] ; then echo '{"dependencies": {}}' > package.json ; fi  \
  && npm install \
  coc-css \
  coc-eslint \
  coc-html \
  coc-json \
  coc-pairs \
  coc-prettier \
  coc-snippets \
  coc-tsserver --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod

WORKDIR /home/neovim

RUN nvim +PlugInstall +qa  \
  && nvim +"CocInstall -sync \
  coc-css \
  coc-eslint \
  coc-html \
  coc-json \
  coc-pairs \
  coc-prettier \
  coc-ultisnips \
  coc-tsserver | qa"  \
  && mkdir workdir \
  && touch .profile && echo 'alias ll="ls -al"' >> .profile

ENV ENV=/home/neovim/.profile

WORKDIR /home/neovim/workdir

CMD ["/bin/sh" "-c" "['/usr/bin/nvim']"]
