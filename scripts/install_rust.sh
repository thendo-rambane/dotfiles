#!/bin/expect -f

echo -e "\n"
echo "========================================[Installing Rust]"
echo -e "\n"

set timeout -1

spawn curl https://sh.rustup.rs -sSf | sh

expect ">\r"

send -- "\r"

expect "*/env\r"

send -- "\r"

expect eof 
