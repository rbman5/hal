#!/bin/bash
#
#Send messages through SSH to remote hosts' notify-osd
#
message="$@"
ssh -X root@192.168.1.16 "DISPLAY=:0 notify-send \"$message\""
exit
