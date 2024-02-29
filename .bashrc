export CDPATH=".:~:~/src:~/src/docker"
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export BROWSER="open -a /Applications/Brave\ Browser.app/ -g"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOMEBREW_PREFIX/opt/gawk/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"

# completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# liquidprompt
if [ -f /opt/homebrew/share/liquidprompt ]; then
  . /opt/homebrew/share/liquidprompt
fi

# shopts
shopt -s autocd cdspell dirspell

set -o histexpand

# Enable vi mode
set -o vi

# Aliases
alias vim="nvim"
alias vimconf="vim ~/.config/nvim/init.lua"
alias vimcd="cd ~/.config/nvim"
alias ls="ls --color=auto"
alias l="ls -lh"
alias ll="ls -ahlF"

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
alias nvm_upgrade="nvm install node --reinstall-packages-from=node --latest-npm"

# Kittens
alias icat="kitty +kitten icat"
alias s="kitty +kitten ssh"
alias d="kitty +kitten diff"

# Sneklang
alias python="python3"
alias py="python3"

# Go
export PATH=$PATH:$(go env GOPATH)/bin:~/.local/bin
export GOPATH=$(go env GOPATH)

# terminal browser
export browsh="docker run -it --rm --network=host browsh/browsh"

# toggle themes
function use_light_mode() {
  kitty +kitten themes --reload-in=all Adwaita light
}
function use_dark_mode() {
  kitty +kitten themes --reload-in=all Adwaita darker
}

# silence
export DOCKER_CLI_HINTS=false
export BASH_SILENCE_DEPRECATION_WARNING=1

# create asciinema recording with nice defaults
alias rec="asciinema rec --cols 80 --rows 20"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
