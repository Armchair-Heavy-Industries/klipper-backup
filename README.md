Small tool to support backing up / restoring printer_data contents to a git repo

run with `./run.sh --backup` initially

`./run.sh --restore` for restoring a printer to a backup

`./run.sh --remove` will undo the git repo + cron stuff the script does.


Installation:
```
cd ~ && git clone https://github.com/Armchair-Heavy-Industries/klipper-backup && cd klipper-backup
cp ./config_vars.template ./config_vars
nano ./config_vars
```
