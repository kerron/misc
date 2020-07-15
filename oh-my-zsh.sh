# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Add rustup
export PATH="$HOME/.cargo/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/kerron/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  k
  autojump
)

source $ZSH/oh-my-zsh.sh

# ALIAS

# User configuration
alias svim='source ~/.vimrc'
alias sgit='source ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
alias szsh='source ~/.zshrc'
alias gitrc='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias python='python3'
alias rpe='cd /Users/kerron/Downloads/reinfer/ && source env/bin/activate && cd /Users/kerron/Downloads/reinfer/platform && j webapp' 
alias f='flutter'
alias pd='cd ~/Downloads/reinfer/platform && ./ci/jenkins/fs/scripts/ci-purge-docker' 
alias ssp='cd ~/Downloads/reinfer/platform && ./tools/start-dev-environment --pull' 
alias ssf='cd ~/Downloads/reinfer/platform && ./tools/start-dev-environment' 
alias ss='cd ~/Downloads/reinfer/platform && ./tools/start-dev-environment --minimal' 
alias rna='react-native run-android'
alias ys='yarn start'
alias yi='yarn install --force'
alias yb='yarn build'
alias gvrc='vi ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
alias yt='yarn test --testPathPattern '
alias ytw='yarn test --testPathPattern --watch '
alias es='expo start'
alias esc='expo start -c'
alias ls="gls -1 --color=always"
alias rios='react-native run-ios'
alias rdroid='react-native run-android'
alias fla='flutter emulators --launch android'
alias fli='open -a Simulator'
alias fra='flutter run -d emulator-5554'
alias fri='flutter run -d 427335FA-DA63-4896-998D-B579BEBFC404'
alias fpg='flutter pub get'

DEFAULT_USER=`whoami`

prompt_dir() {
  prompt_segment blue black "${PWD##*/}"
}

function cd {
  builtin cd "$@" && ls
}
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export PATH="$PATH:/Users/kerron/Downloads/dev/flutter/bin"
# The ip address that docker containers will bind to.
export DOCKER_GATEWAY="192.168.65.2"
export DOCKER_COMPOSE_BIND="127.0.0.1"

# export DOCKER_COMPOSE_BIND="$(docker network inspect bridge -f '{{(index .IPAM.Config 0).Gateway}}')"
# if [ `uname` = "Darwin" ]; then
  # export DOCKER_GATEWAY="host.docker.internal"
# else
  # export DOCKER_GATEWAY=$DOCKER_COMPOSE_BIND
# fi
# export DOCKER_GATEWAY="172.17.0.1"
# The rethinkdb endpoint for tests.
export RETHINKDB_TEST_ENDPOINT=localhost:28015

# The ldap endpoint for tests.
export LDAP_TEST_ENDPOINT=localhost:8389

# The elasticsearch endpoint for tests.
export ELASTICSEARCH_TEST_ENDPOINT=localhost:9200
export DUCKLING_TEST_ENDPOINT=localhost:8026

# The prefix used for rethinkdb test databases (you'll need a different one if
# running multiple instances of `py.test` at once.
export REINFER_TEST_NAMESPACE='python'

# The default model family for datasets.
# For a real deployment this would typically be `english`. `english-dev` is the
# same model architecture, but trained only with very few iteratioons. An
# alternative fast model is `random`, but expect random predictions.
export DEFAULT_MODEL_FAMILY="english-dev"

# The model for unsupervised learning (bulk label / discover page). Change to
# `random-k30` for fast (but random) model for development.
export THEME_MODEL_ID="ne-rs-cnmf-max4096-k30"

# docker-compose project name
export COMPOSE_PROJECT_NAME='reinfer'

# Diff runner defaults
export DIFF_RUNNER_DOCKER_NETWORK='reinfer_default'
export DIFF_RUNNER_LINKS='RETHINKDB_TEST_ENDPOINT=rethinkdb:reinfer_rethinkdb_1:28015,ELASTICSEARCH_TEST_ENDPOINT=elasticsearch:reinfer_elasticsearch_1:9200,DUCKLING_TEST_ENDPOINT=duckling:reinfer_duckling_1:8026,LDAP_TEST_ENDPOINT=openldap:reinfer_openldap_1:8389'
# The prefix used for rethinkdb test databases (you'll need a different one if
# running multiple instances of `py.test` at once.

export OMP_NUM_THREADS=4

export MYPYPATH=${HOME}/Downloads/reinfer/platform/api:${HOME}/Downloads/reinfer/platform/auth:${HOME}/Downloads/reinfer/platform/index:${HOME}/Downloads/reinfer/platform/user-model:${HOME}/Downloads/reinfer/platform/user-model-store:${HOME}/Downloads/reinfer/platform/predict/server:${HOME}/Downloads/reinfer/platform/predict/shared:${HOME}/Downloads/reinfer/platform/pycommon:${HOME}/Downloads/reinfer/platform/pyrethool:${HOME}/Downloads/reinfer/platform/pyweb:${HOME}/Downloads/reinfer/platform/refile/client:${HOME}/Downloads/reinfer/platform/refile/server:${HOME}/Downloads/reinfer/platform/rpz:${HOME}/Downloads/reinfer/platform/sentence:${HOME}/Downloads/reinfer/platform/store:${HOME}/Downloads/reinfer/platform/summary/client:${HOME}/Downloads/reinfer/platform/summary/server:${HOME}/Downloads/reinfer/platform/theme:${HOME}/Downloads/reinfer/platform/train:${HOME}/Downloads/reinfer/platform/trigger/server:${HOME}/Downloads/reinfer/platform/trigger/client:${HOME}/Downloads/reinfer/platform/labels-gc:${HOME}/Downloads/reinfer/platform/entity/client:${HOME}/Downloads/reinfer/platform/entity/server:${HOME}/Downloads/reinfer/platform/duckling/client:${HOME}/Downloads/reinfer/platform/sources-gc

 #Tunnel to jenkins.
function jenkins () {
    local port1=${1:-39101}
    local port2=${2:-39102}
    sh -c "sleep 2 && open http://localhost:${port1}" &
    gcloud compute ssh --project=reinfer-ci --zone=europe-west1-c jenkins -- -L ${port1}:localhost:8080 -L ${port2}:localhost:8971
}

# Tunnel to staging rethinkdb database.
function staging-rethink () {
    local port=${1:-38016}
    gcloud compute ssh --project=reinfer-staging --zone=europe-west1-c rethink-1 -- -L ${port}:rethink-1:28015 -L 30048:rethink-1:8080
}

# Tunnel to prod rethinkdbdatabase.
function prod-rethink () {
    local port=${1:-48016}
    gcloud compute ssh --project=reinfer-prod --zone=europe-west1-d rethink-7k30 -- -L ${port}:rethink-7k30:28015 -L 40048:rethink-7k30:8080
}


# Staging kubectl shortcut.
alias kcs="kubectl --cluster gke_reinfer-staging_europe-west1-c_main"
# Prod kubectl shortcut.
alias kcp="kubectl --cluster gke_reinfer-prod_europe-west1-c_main"

# Docker compose shortcuts.
alias dc='docker-compose'
alias dcr='docker-compose rm'
alias dcu='docker-compose up'
alias dcs='docker-compose stop'
alias dcb='docker-compose build'

# Gcloud shortcuts
alias cl=gcloud
alias co='gcloud compute'
alias cssh='gcloud compute ssh'
alias gu=gsutil
alias start_services='~/Downloads/reinfer/platform/tools/start-dev-environment'
alias rcon='/Users/kerron/Downloads/reinfer/platform/tools/gcp/rcon'

# SOURCE
source <(kubectl completion zsh)
source '/Users/kerron/google-cloud-sdk/completion.zsh.inc'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
wd() {
  . /Users/kerron/bin/wd/wd.sh
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kerron/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kerron/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kerron/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kerron/google-cloud-sdk/completion.zsh.inc'; fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
