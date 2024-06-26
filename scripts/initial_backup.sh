#!/bin/bash

gh repo create $REPONAME --private
cd /home/$USERNAME/printer_data
git init
git branch -m $BRANCHNAME
git remote add origin https://github.com/$GHUSERNAME/$REPONAME.git

printf "systemd/\nlogs/\ncomms/\ncerts/\ngcodes/\nbackup/\nmoonraker.asvc\nmisc/usb.ids\n.moonraker.uuid\n.theme/\n" > .gitignore
git add .
git commit -m "first backup"
git push -u origin $BRANCHNAME