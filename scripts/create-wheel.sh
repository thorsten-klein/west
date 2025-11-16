#!/bin/bash

GIT_ROOT=$(git rev-parse --show-toplevel)
PATCH_DIR="$GIT_ROOT/patches"

cd $GIT_ROOT
PYTHONPATH="." python3 -m build --wheel
