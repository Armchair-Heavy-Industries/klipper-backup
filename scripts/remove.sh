#!/bin/bash

# removes the git repo in printer_data
# removes the cron job
# removes the printerbackup.sh script
# does not remove the printer_data folder or anything in it
# does not remove the hosted github repo
# does not undo git config

echo "removing cron job..."
crontab -u $USERNAME -l | grep -v "printerbackup.sh"  | crontab -u $USERNAME -
echo "removing printerbackup.sh..."
rm /home/$USERNAME/printerbackup.sh
echo "removing local git repo..."
rm -rf /home/$USERNAME/printer_data/.git
echo "done"