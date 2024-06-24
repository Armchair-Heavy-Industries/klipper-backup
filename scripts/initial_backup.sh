#!/bin/bash
gh repo create $REPONAME --private
cd /home/$USERNAME/printer_data
git init
printf "logs/\ncomms/\ncerts/\ngcodes/\nbackup/\nmoonraker.asvc\n" > .gitignore
git remote add origin https://github.com/$GHUSERNAME/$REPONAME.git
git add .
git commit -m "first backup"
git push -u origin $BRANCHNAME