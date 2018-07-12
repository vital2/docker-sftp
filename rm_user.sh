#!/bin/bash

# Remove User 
userdel -r $1
rm -rf /home/$1
