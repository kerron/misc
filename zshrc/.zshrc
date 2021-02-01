# export PATH=$HOME/bin:/usr/local/bin:$PATH
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$PATH:/Users/kerronparchment/Documents/misc/flutter/bin"
export PATH="$PATH:`pwd`/flutter/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export FZF_DEFAULT_COMMAND='fd --type f '
export BAT_THEME="base16-256"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
export AWS_DEFAULT_REGION=$(aws configure get region)

# Path to your oh-my-zsh installation.
export ZSH="/Users/kerronparchment/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  autojump
)
# fzf custom
# alias vf='vim -o `fzf` --preview="bat --style=numbers --color=always {}" --bind=ctrl-j:preview-down --bind=ctrl-k:preview-up'

alias gdf="git status -s \
 | fzf --no-sort --reverse \
 --preview 'bat git diff --color=always {+2} | diff-so-fancy' \
 --bind=ctrl-j:preview-down --bind=ctrl-k:preview-up \
 --preview-window=right:wrap"
# end fzf custom
alias vf='vim $(fzf \
--no-sort \
--reverse \
--preview "bat --style=numbers --color=always --line-range :500 {}" \
--bind=ctrl-j:preview-down \
--bind=ctrl-k:preview-up \
--preview-window=right:wrap)'
alias vim='nvim'
alias vi='nvim'
alias cocs='vim ~/.config/nvim/coc-settings.json'
alias svim='source ~/.vimrc'
alias sgit='source ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
alias szsh='source ~/.zshrc'
alias gitrc='nvim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
alias zshrc='nvim ~/.zshrc'
alias vimrc='nvim ~/.vimrc'
alias rns='react-native start --reset-cache'
alias rna='react-native run-android'
alias rnapr='react-native run-android --variant=release'
alias rnap='cd android && ./gradlew clean && ./gradlew bundleRelease && cd ..'
alias gtr='cd android/app/build/outputs/bundle/release'
alias gtrapk='cd android/app/build/outputs/apk/release'
# alias rna='react-native run-android --deviceId=8f626271'
alias lae='emulator -avd p3a'
alias le='emulator -list-avds'
alias fdf='firebase deploy --only functions'
# THS
alias rtths='/Users/kerronparchment/Documents/dev/trustedhousesitters-next/stack && stack local run web-tests-watch'
alias sths='/Users/kerronparchment/Documents/dev/trustedhousesitters-next/stack && source env/bin/activate'
alias rths="/Users/kerronparchment/Documents/dev/trustedhousesitters-next/stack && stack local run web-dev "
alias bths='/Users/kerronparchment/Documents/dev/trustedhousesitters-next/stack && stack local build web-dev'
alias saths="/Users/kerronparchment/Documents/dev/trustedhousesitters-next/stack && stack local run web-tests-watch "
# alias saths="docker exec -it `docker ps | grep stack_web | head -1 | cut -d' ' -f1` yarn build-angular && cd .."
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

DEFAULT_USER=$(whoami)

prompt_dir() {
  prompt_segment blue black "${PWD##*/}"
}

function cd {
  builtin cd "$@" && ls
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
