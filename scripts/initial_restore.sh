#!/bin/bash

# restores printer_data from github

cd /home/$USERNAME/printer_data
git init
git remote add origin https://github.com/$GHUSERNAME/$REPONAME.git
git fetch origin
git reset --hard origin/$BRANCHNAME