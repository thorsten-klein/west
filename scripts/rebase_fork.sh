#!/bin/bash

# original remote
ORIGINAL_URL="https://github.com/zephyrproject-rtos/west.git"
REMOTE_BRANCH="main"

# fork details
FORK_URL="https://github.com/thorsten-klein/west.git"
FORK_BRANCH="main-with-patches"

# add remote "fork" if not already exists
if ! git remote | grep -q "^fork$"; then
    git remote add fork "$FORK_URL"
fi

# add remote original if not already exists
if ! git remote | grep -q "^original$"; then
    git remote add original "$ORIGINAL_URL"
fi

# fetch fork and original remote
git fetch fork
git fetch original

# checkout FORK_BRANCH from fork
git checkout -B "$FORK_BRANCH" "fork/$FORK_BRANCH" || \
git checkout -b "$FORK_BRANCH" "original/$REMOTE_BRANCH"

# rebase FORK_BRANCH onto REMOTE_BRANCH
git rebase "original/$REMOTE_BRANCH" || (
    echo "Rebase encountered conflicts. Please resolve them and run 'git rebase --continue' or abort"
)

echo "Done!"