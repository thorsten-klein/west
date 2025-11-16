#!/bin/bash

GIT_ROOT=$(git rev-parse --show-toplevel)
PATCH_DIR="$GIT_ROOT/patches"

# original remote
REMOTE_NAME="original"
REMOTE_BRANCH="main"

# create patch files for each commit from FORK_BRANCH not in REMOTE_BRANCH
mkdir -p "$PATCH_DIR"
git format-patch "$REMOTE_NAME/$REMOTE_BRANCH" -o "$PATCH_DIR"

git add "$PATCH_DIR"

echo "Done!"
