ZSH=$HOME/.oh-my-zsh
ZSH_THEME="smt"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(bundler capistrano catimg colorize command-not-found gem git osx ssh-agent sublime virtualenv zsh-syntax-highlighting)

# Here be the aliases
alias pull='git pull --rebase origin master'
alias pulld='git pull --rebase origin development'
alias fs='foreman start'
alias pi='pod install --verbose --no-repo-update'

export PATH="/usr/local/bin:$PATH"
export EDITOR='vim'
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# https://webdevstudios.com/2015/02/10/a-beginners-guide-to-the-best-command-line-tools/
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# Let's GO!
export GOPATH=$HOME/Code/go
export PATH="$GOPATH/bin:$PATH"

# Use rbenv instead
# if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
# PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

source $ZSH/oh-my-zsh.sh
source ~/.git-flow-completion.zsh
PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH" # Add Postgres.app to PATH
### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"
