#!/bin/bash

printf "Input ReMarkable IP: "
read IP

scp -r -p root@$IP:/home/root/.local/share/remarkable/xochitl/ .
