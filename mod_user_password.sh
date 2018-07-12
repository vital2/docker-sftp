#!/bin/bash

# set password
echo "$1:$2" | chpasswd
