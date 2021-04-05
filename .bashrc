#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias morning='cp ~/.config/termite/configMorning ~/.config/termite/config; killall -USR1 termite'
alias night='cp ~/.config/termite/configNight ~/.config/termite/config; killall -USR1 termite'

alias projects='cd ~/Projects'
