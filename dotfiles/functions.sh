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

function sbr {
    curl proxy.sandbox.yandex-team.ru/$1
}

function curlnir {
    curl --insecure -H "Authorization: OAuth $(cat ~/.tokens/nirvana)" ${@}
}

 function yr() {
      YT_PROXY=hahn yt read $1 --format "<columns=[$2]>schemaful_dsv" \
      --config "{read_parallel={enable=%true;max_thread_count=50;}}"
 }

function yw() {
    YT_PROXY=hahn yt write-table --table ${1} --format "<columns=[$2]>schemaful_dsv" \
    --config "{write_parallel={enable=%true;max_thread_count=50;}}"
}

function diffhtml() {
  #vimdiff ${1} ${2} -c 'colo default' -c TOhtml -c "w! ${3}" -c 'qa!'
  N=($# - 1)
  vimdiff "${@:1:$N}" -c 'colo default' -c TOhtml -c "w! ${@[$#]}" -c 'qa!'
}

#alias cdr="cd /place/rj42"

alias ya='~/arcadia/ya'
alias yamake='~/arcadia/ya make -I ~/arc/build/bin'
alias m=yamake

alias cdp='cd ~/projects'
