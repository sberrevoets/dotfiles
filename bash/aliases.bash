alias .=pwd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

alias g=git
# https://www.quora.com/How-can-I-make-a-git-alias-that-executes-a-cd
alias gr='cd $(git rev-parse --show-toplevel)'
alias v=vim

alias df='cd ~/dotfiles'

alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
