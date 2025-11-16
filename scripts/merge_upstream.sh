#!/bin/bash

# original remote
REMOTE_NAME="original"
REMOTE_BRANCH="main"

# fork details
FORK_NAME="fork"
FORK_BRANCH="main-with-patches"

# fetch fork and original remote
git fetch fork
git fetch original

# checkout FORK_BRANCH from fork
git checkout -B "$FORK_BRANCH" "fork/$FORK_BRANCH" || \
git checkout -b "$FORK_BRANCH" "original/$REMOTE_BRANCH"

# merge REMOTE_BRANCH into FORK_BRANCH to keep a linear history
git merge "original/$REMOTE_BRANCH" || (
    echo "Merge encountered conflicts. Please resolve them and run 'git merge --continue' or abort"
)

echo "Done!"