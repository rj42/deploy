function vimdiffn {
    N=$1
    vimdiff <(head -n$N $2) <(head -n$N $3)
}

function fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}

function part() {
    cat $2 | head -n$1 >$2.part
}

function swap() {
    f=$1
    t=$2
    mv ${f} ${f}_tmp
    mv ${t} ${f}
    mv ${f}_tmp ${t}
}

function jnote() {
    P=${1:-12000}
    jupyter notebook --ip='0.0.0.0' --port ${P} --allow-root --no-browser --NotebookApp.token='' 
}

#alias cdr="cd /place/rj42"
