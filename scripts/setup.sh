#!/bin/bash


echo "installing curl and gh..."
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y

echo "logging you into github... please follow the prompts";
echo "typically you'll want to select 'github.com' and then 'HTTPS'";
echo "you'll need to manually open the link in a browser."
read -p "Press any key to continue to login..."

gh auth login
git config --global user.email $EMAIL
git config --global user.name $FULLNAME

printf "cd /home/$USERNAME/printer_data\ngit add .\ngit commit -m "backup"\ngit push -u origin $BRANCHNAME\n" > /home/$USERNAME/printerbackup.sh
chmod +x /home/$USERNAME/printerbackup.sh
printf "0 */2 * * * /home/$USERNAME/printerbackup.sh\n" | crontab -u $USERNAME -
