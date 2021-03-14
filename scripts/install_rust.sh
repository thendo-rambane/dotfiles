#!/bin/expect -f

set timeout -1

spawn $HOME/dotfiles/scripts/get_rustup.sh

expect "*>*"

send -- "1\r"

expect "*/env\r"

send -- "\r"

expect eof 
