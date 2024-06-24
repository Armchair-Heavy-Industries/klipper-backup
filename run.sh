export NAME="your printer's name"
export EMAIL="your github email"
export FULLNAME="your github name"
export GHUSERNAME="your github username"

#error if name is still default
if [ $NAME == "your printer's name" ]; then
    echo "Please set your printer's name in run.sh"
    exit 1
fi

export USERNAME=pi
export REPONAME=$NAME\_backup
export BRANCHNAME=master # sometimes this is main

# --restore, --backup, --remove
# error if both --restore and --backup are passed
# if --remove is passed, don't run initial setup
if [ $# -eq 0 ]; then
    echo "please pass --restore, --backup, or --remove"
    exit 1
elif [ $# -eq 1 ]; then
    elif [ $1 == "--remove" ]; then
        echo "Removing..."
        bash scripts/remove.sh
    elif [ $1 == "--restore" ]; then
        echo "setting up..."
        bash scripts/setup.sh
        echo "Restoring..."
        bash scripts/initial_restore.sh
    elif [ $1 == "--backup" ]; then
        echo "setting up..."
        bash scripts/setup.sh
        echo "Backing up..."
        bash scripts/initial_backup.sh
    else
        echo "Invalid argument. Please pass --restore or --backup, or --remove"
        exit 1
else 
    echo "Please pass only one argument"
    exit 1
fi

echo "done"