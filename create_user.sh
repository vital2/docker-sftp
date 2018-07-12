#!/bin/bash

# quietly add a user without password and also add to group sftpusers
useradd -g sftpusers -d /files -s /sbin/nologin $1

# Make home directory
mkdir -p /home/$1/files
chown $1:sftpusers /home/$1/files

# set password
echo "$1:$2" | chpasswd
