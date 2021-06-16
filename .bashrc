#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h:\W]\$ '

# /etc/bash.bashrc on Arch only sets PROMPT_COMMAND for other terms, not alacritty
# add this so Alacritty updates its window title for bash, shows current location
case ${TERM} in
  alacritty)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
esac

alias morning='cp ~/.config/termite/configMorning ~/.config/termite/config; killall -USR1 termite'
alias night='cp ~/.config/termite/configNight ~/.config/termite/config; killall -USR1 termite'

alias projects='cd ~/Projects'
