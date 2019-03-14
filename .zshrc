# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/shizuka/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

autoload -Uz colors
colors

PROMPT="%{$fg[green]%}%D{%T}%  %~$ %{${reset_color}%}" 
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad
alias molpath='cd ~/go/src/github.com/moldcoin/moldex/'
