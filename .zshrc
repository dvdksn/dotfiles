# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
case "$(uname -s)" in
  Darwin*)   export ZSH="/Users/david/.oh-my-zsh";;
  Linux*)    export ZSH="/home/david/.oh-my-zsh";;
esac

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

function select_theme {
  if [[ $THEME == "light" ]]; then
    echo "dvdksn-light";
  else
    echo "dvdksn-dark";
  fi
}

ZSH_THEME=$(select_theme)

# Use case-sensitive completion.
CASE_SENSITIVE="false"

# Use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Disable auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Auto-update frequency (in days).
export UPDATE_ZSH_DAYS=13

# Command auto-correction.
# ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# ZSH plugins
plugins=(git docker vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set language environment.
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set XDG variables
export XDG_CONFIG_HOME="$HOME/.config"

# Set `cd` PATH
export CDPATH=~:..:~/src

# Enable vi mode
bindkey -a -r ':'
bindkey -v
export VI_MODE_SET_CURSOR=true

alias vim="nvim"
alias vimconf="vim ~/.config/nvim/init.lua"
alias vimcd="cd ~/.config/nvim"

case "$(uname -s)" in
  Darwin*)
    export BROWSER="open -a /Applications/Firefox\ Developer\ Edition.app/ -g"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH="$HOMEBREW_PREFIX/opt/gawk/libexec/gnubin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"
    ;;
  Linux*)
    export BROWSER=/usr/bin/firefox-developer-edition
    ;;
esac

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias nvm_upgrade="nvm install node --reinstall-packages-from=node --latest-npm"

# Kittens
alias icat="kitty +kitten icat"

# Sneklang
alias python="python3"
alias py="python3"

# Go
export PATH=$PATH:$(go env GOPATH)/bin:~/.local/bin
export GOPATH=$(go env GOPATH)

# terminal browser
export browsh="docker run -it --rm --network=host browsh/browsh"

# enable light mode
function use_light_mode() {
  kitty +kitten themes --reload-in=all Adwaita light
  export THEME="light"
  omz reload
}

# enable dark mode
function use_dark_mode() {
  kitty +kitten themes --reload-in=all Adwaita darker
  export THEME="dark"
  omz reload
}

# infer current theme from GNOME desktop settings
if [[ "$XDG_CURRENT_DESKTOP" = "GNOME" ]]; then
  case "$(gsettings get org.gnome.desktop.interface gtk-theme)" in
    default)        use_light_mode;;
    prefer-dark)    use_dark_mode;;
  esac
fi

# clear right prompt after command
setopt transientrprompt

# disable docker cli hints
export DOCKER_CLI_HINTS=false

# create asciinema recording with nice defaults
alias rec="asciinema rec --cols=80 --rows=25"

# ocaml
eval $(opam env)

# fuck
eval $(thefuck --alias)
