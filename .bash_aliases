# nvm PATH
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# pyenv PATH
if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

#golang PATH
if [ -d "/usr/local/go" ]; then
  export PATH="$PATH:/usr/local/go/bin"
  export GOPATH="$HOME/go"
  export PATH="$PATH:$GOPATH/bin"
  export GOBIN=$GOPATH/bin
  export GO111MODULE=on
fi

## rust PATH
if [ -d "$HOME/.cargo" ]; then
  . "$HOME/.cargo/env"
fi

## deno PATH
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

## alias
alias gg='git log --graph --oneline --decorate --all'
alias vim='nvim'
