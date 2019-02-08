# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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
)

source $ZSH/oh-my-zsh.sh

# User configuration
alias opengit='open ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
alias sgit='source ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
alias openzsh='open ~/.zshrc'
alias szsh='source ~/.zshrc'

DEFAULT_USER=`whoami`

prompt_dir() {
  prompt_segment blue black "${PWD##*/}"
}

function cd {
  builtin cd "$@" && ls
}


# The ip address that docker containers will bind to.
export DOCKER_GATEWAY="192.168.65.2"

# The rethinkdb endpoint for tests.
export RETHINKDB_TEST_ENDPOINT=localhost:28015

# The ldap endpoint for tests.
export LDAP_TEST_ENDPOINT=localhost:8389

# The elasticsearch endpoint for tests.
export ELASTICSEARCH_TEST_ENDPOINT=localhost:9200

# The prefix used for rethinkdb test databases (you'll need a different one if
# running multiple instances of `py.test` at once.
export REINFER_TEST_NAMESPACE='python'

# The default model family for datasets; you can change to `random` if you want
# a fast (but random) model for development instead.
export DEFAULT_MODEL_FAMILY="english"

# The model for unsupervised learning (bulk label / discover page). Change to
# `random-k30` for fast (but random) model for development.
export THEME_MODEL_ID="ne-rs-cnmf-max4096-k30"


# Tunnel to jenkins.
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

# ALIAS

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
alias start_services='dc up -d rethinkdb elasticsearch auth api summary-service summary-updater label predict train nginx refile refile-gc'
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
