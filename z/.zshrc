#!/bin/sh

autoload -Uz compinit promptinit && promptinit
compinit
promptinit

zstyle ':completion:*' menu select

prompt_mytheme_setup() {
  PS1='%F{white}%B%m%B@%F{red}%n %F{pink}%B%~%b%f %# '
}
# This will set the default prompt to the walters theme
# prompt walters

prompt_themes+=( mytheme )

prompt mytheme
