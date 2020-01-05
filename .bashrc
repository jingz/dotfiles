
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

###-tns-completion-start-###
if [ -f /Users/jing/.tnsrc ]; then 
    source /Users/jing/.tnsrc 
fi
###-tns-completion-end-###

# tmux
alias tmat="tmux attach-session -t "

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


        *)
            echo "projects shoud be in (dca, zd, seekster, abacus, agrichain, mbot, dict, ir) list" 
        ;;
    esac
}

# js
alias q='quasar'
alias qda='quasar dev -m cordova -T android'
alias qdi='quasar dev -m cordova -T ios'

# vue-cli
alias csa='yarn run cordova-serve-android'
alias csi='yarn run cordova-serve-ios'

# vim
export EDITOR=vim
alias v=vim

# tmux
alias tm=tmux
alias tmkill='tmux kill-session -t '
alias tmkilla='tmux kill-session -a' # kill all session
alias tmls='tmux list-sessions'

# python
alias pm='python manage.py '

# elasticsearch
export ES_HOST='http://localhost:9200'

# mdb-tool
export MDBICONV='UTF-8'
export MDB_JET3_CHARSET='CP874'

# Gradle
export PATH=$PATH:/opt/gradle/gradle-5.3/bin

# Android
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export ANDROID_HOME='/Users/jing/Library/Android/sdk'
export ANDROID_AVD_HOME=$HOME/.android/avd
export ANDROID_SDK_ROOT=${ANDROID_HOME}
export PATH="${PATH}:${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools"

# Ruse
export PATH="${PATH}:$HOME/.cargo/env"

# export ANDROID_HOME=/Development/android-sdk/
# export PATH=${PATH}:/Development/android-sdk/platform-tools:/Development/android-sdk/tools

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.bash ]; then
  source /usr/local/opt/fzf/shell/key-bindings.bash
  source /usr/local/opt/fzf/shell/completion.bash
fi

# company proxy
function set_mfec_proxy () {
    export http_proxy=http://lpn.mfec.co.th:8080
    export https_proxy=http://lpn.mfec.co.th:8080
}

function unsetproxy () {
    unset http_prox
    unset https_proxy
}

# Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH" 
alias aws-scb='ssh ec2-user@54.179.144.183' # dev
alias aws-scbs='ssh ec2-user@18.136.152.146' # sit

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

###-tns-completion-start-###
if [ -f /Users/jing/.tnsrc ]; then 
    source /Users/jing/.tnsrc 
fi
###-tns-completion-end-###

# better cli
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"

alias xdu="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias dc="docker-compose"

# improve ctrl-r
if [[ -f "$(brew --prefix)/opt/mcfly/mcfly.bash" ]]; then
  source "$(brew --prefix)/opt/mcfly/mcfly.bash"
fi

# Flutter
export PATH="$PATH:~/flutter/bin"
