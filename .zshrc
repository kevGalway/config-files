# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Show history timestamp in history
HIST_STAMPS="dd.mm.yyy"

plugins=(
  git
  rails
  ruby
  bundler
  autojump
  web-search
  dirhistory
  gitfast
  git-extras
  npm
  colored-man-pages
  colorize
  command-not-found
  history
  battery
  themes
  alias-tips
  docker
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias wp="webpack --watch --colors --progress"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set Vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

autoload -U compinit
compinit

if [ -z "$TMUX" ]; then 
    tmux attach -t default || tmux
new -s default
fi

export PATH=/usr/local/aws/bin:$PATH
source /usr/local/aws/bin/aws_zsh_completer.sh

#Syntax highlighting in zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting

