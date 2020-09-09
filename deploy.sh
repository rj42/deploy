#!/usr/bin/env bash
set -euo pipefail

NAME=vla1-5959.search.yandex.net
NAME=bastinda.yandex.ru
NAME=zabava.search.yandex.net
NAME="keyboard-dev2.search.yandex.net"

function run() {
    com=$1
    #ssh -t ${NAME} "${com}"
    eval ${com}
}

function copy() {
    from=dotfiles/$1
    to=$2
    #scp ${from} ${NAME}:${to}
    cp ${from} ${to}
}

# zsh
#
run 'curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -'
run 'sed -i "s|ZSH_THEME=\"robbyrussell\"|ZSH_THEME=\"bureau\"|g" ~/.zshrc'
run 'git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ya | ~/.fzf/install'

copy functions.sh ~/.functions
copy vimrc ~/.vimrc
copy tmux.conf ~/.tmux.conf

# vim
#
run "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"

# tmux
#
run "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"

# Miscellaneous
#
run 'echo -e "\nsource ~/.functions\n" >> ~/.zshrc'
run 'echo -e "DISABLE_AUTO_TITLE=true\nunsetopt share_history" >>~/.zshrc'
run 'echo -e "exec zsh" >>~/.bashrc'

# Arcadia
#
run 'svn export svn+ssh://arcadia.yandex.ru/arc/trunk/arcadia/ya ~/ya'
