# nvm PATH
if [ -f ~/.nvm ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# pyenv PATH
if [ -f ~/.pyenv ]; then
    . ~/.bash_aliases
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

#golang PATH
if [ -f /usr/local/go ]; then
    export PATH="$PATH:/usr/local/go/bin"
    export GOPATH="$HOME/go"
    export PATH="$PATH:$GOPATH/bin"
    export GOBIN=$GOPATH/bin
    export GO111MODULE=on
fi

## rust PATH
if [ -f ~/.cargo ]; then
    . "$HOME/.cargo/env"
fi

## deno PATH
if [ -f ~/.deno ]; then
    export DENO_INSTALL="$HOME/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
fi

## alias
alias gg='git log --graph --oneline --decorate --all'
alias vim='nvim'
