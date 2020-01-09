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
    from=stuff/$1
    to=$2
    #scp ${from} ${NAME}:${to}
    cp ${from} ${to}
}

# zsh
#
#run 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed "s/chsh -s/#chsh/g")"'
#run 'sed -i "s|ZSH_THEME=\"robbyrussell\"|ZSH_THEME=\"bureau\"|g" ~/.zshrc'
#copy bash_profile ~/.bash_profile
#run 'git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ya | ~/.fzf/install'

copy functions ~/.functions
copy vimrc ~/.vimrc
copy tmux.conf ~/.tmux.conf

# vim
#
run "git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"

# Miscellaneous
#
run 'echo -e "\nsource ~/.functions\n" >> ~/.zshrc'
run 'echo -e "DISABLE_AUTO_TITLE=true\nunsetopt share_history" >>~/.zshrc'
run 'echo -e "exec zsh" >>~/.bashrc'

# Arcadia/abyss
#
run 'svn export svn+ssh://arcadia.yandex.ru/arc/trunk/arcadia/ya ~/ya'
run 'curl http://nlp.yandex.ru/_downloads/get-vh.sh | bash -'
