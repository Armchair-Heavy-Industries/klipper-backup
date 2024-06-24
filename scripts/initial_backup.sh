#!/bin/bash
gh repo create $REPONAME --private
cd /home/$USERNAME/printer_data
git init
git remote add origin https://github.com/$GHUSERNAME/$REPONAME.git


printf "logs/\ncomms/\ncerts/\ngcodes/\nbackup/\nmoonraker.asvc\nmisc/usb.ids\n.moonraker.uuid\n" > .gitignore
git add .
git commit -m "first backup"
git push -u origin $BRANCHNAME