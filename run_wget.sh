#!/bin/zsh
while true
do
    sleep 10 || wget -qO- 127.0.0.1:8000/encrypt/version > "wget_log.txt";
	sleep 1
done