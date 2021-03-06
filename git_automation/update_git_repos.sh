#!/bin/bash
#Forked from: https://gist.github.com/douglas/1287372

# store the current dir
CUR_DIR=$(pwd)

# Let the person running the script know what's going on.
echo "=====Pulling in latest changes for all repositories====="

# Find all git repositories and update it to the master latest revision
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
    echo "====="+$i+"=====";

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    # finally pull
    for remote in 'git branch -r';
    do git branch --track ${remote#origin/} $remote;
    done

    git fetch --all
    git pull --all

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo "=====Complete!====="
