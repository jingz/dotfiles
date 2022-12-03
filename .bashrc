[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tmux
function mux() {
    case "$1" in
        "zd")
            project=$1
            cd ~/work/zeekdoc-webapp/
            tmux new-session -s $project -d
            tmux new-window -s "main"

            tmux split-window
            tmux send-keys 'npm run dev' C-m
            tmux select-pane -t 0
            tmux -2 a -t $project
        ;;

        "seekster")
            project=$1
            cd ~/work/api/
            tmux new-session -s $project -d

            # tmux new-window -n "redis"
            # tmux send-keys 'redis-server' C-m

            tmux new-window -n "rails-server"
            tmux send-keys 'rails s' C-m

            tmux split-window
            tmux send-keys 'redis-server' C-m
            tmux split-window -h
            tmux send-keys 'rake utils:get_apikeys' C-m

            tmux select-pane -t 'top'
            tmux split-window -h
            tmux send-keys 'rails s -p 3001 -P seeker.pid' C-m
            tmux split-window -h
            tmux send-keys 'rails s -p 3002 -P provider.pid' C-m

            # tmux new-window -n "sidekiq-server"
            # tmux send-keys 'bundle exec sidekiq' C-m

            tmux select-window -t 0
            tmux -2 a -t $project
        ;;

        "fc")
            project=$1
            cd ~/play/dict/
            tmux new-session -s $project -d

            # tmux new-window -n "redis"
            # tmux send-keys 'redis-server' C-m

            tmux new-window -n "backend-server"

            # cd backend/
            # tmux send-keys 'source venv/bin/activate' C-m
            # tmux send-keys 'python manage run' C-m

            tmux split-window -h

            tmux new-window

            cd ../frontend
            tmux select-window -t 0
            tmux -2 a -t $project
        ;;

        "abacus")
            project=$1
            cd ~/work/scb-abacus/
            tmux new-session -s $project -d
            tmux new-window -s "main"
            tmux send-keys 'source venv/bin/activate' C-m

            tmux split-window -h
            tmux send-keys 'source venv/bin/activate' C-m
            tmux select-pane -t 0
            tmux -2 a -t $project
        ;;

        "agrichain")
            project=$1
            cd ~/work/agrichain/backend
            tmux new-session -s $project -d
            tmux new-window -s "main"
            tmux send-keys 'source venv/bin/activate' C-m
            tmux -2 a -t $project
        ;;

        "dca")
            project=$1
            cd ~/work/dca/dca-backend
            tmux new-session -s $project -d
            tmux new-window -s "main"
            tmux send-keys 'pipenv shell' C-m
            tmux -2 a -t $project
        ;;

        "mbot")
            project=$1
            cd ~/work/mbot
            tmux new-session -s $project -d
            tmux new-window -s "main"
            tmux send-keys 'dc restart' C-m
            tmux -2 a -t $project
        ;;

        "dict")
            project=$1
            cd ~/play/dict/frontend
            tmux new-session -s $project -d
            tmux new-window -s "main"
            tmux split-window -h
            tmux send-keys 'quasar dev' C-m
            tmux select-pane -t 0
            tmux -2 a -t $project
        ;;

        "ir")
            project=$1
            cd ~/work/internreview
            tmux new-session -s $project -d
            tmux new-window -s "main"
            tmux send-keys 'source venv/bin/activate' C-m
            tmux -2 a -t $project
        ;;

        "news")
            project=$1
            cd ~/play/news
            tmux new-session -s $project -d
            tmux new-window -s "main"
            tmux send-keys 'source venv/bin/activate' C-m
            tmux -2 a -t $project
        ;;

        "coupon")
            project=$1
            cd ~/work/seven-eleven/coupon
            tmux new-session -s $project -d
            tmux new-window -s "main"
            tmux -2 a -t $project
        ;;


        *)
            echo "projects shoud be in (dca, zd, seekster, abacus, agrichain, mbot, dict, ir) list"
        ;;
    esac
}

# tmux
alias tm=tmux
alias tmkill='tmux kill-session -t '
alias tmkilla='tmux kill-session -a' # kill all session
alias tmls='tmux list-sessions'
alias tmat="tmux attach-session -t "

# vim
export EDITOR=vim
alias v=vim

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.bash ]; then
  source /usr/local/opt/fzf/shell/key-bindings.bash
  source /usr/local/opt/fzf/shell/completion.bash
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# better cli
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"

alias xdu="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias dc="docker compose"

# improve ctrl-r
if [[ -f "$(brew --prefix)/opt/mcfly/mcfly.bash" ]]; then
  source "$(brew --prefix)/opt/mcfly/mcfly.bash"
fi

# utils
function json2env() {
    jq -r 'to_entries|map("\(.key)=\(.value|tostring)")|.[]' $1
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


function db_am_stg() {
    mongosh "mongodb+srv://jing:osgK0fW2UwRsOuO8@allmember-staging-40.w3bpp.mongodb.net/711_allmember_staging"
}
