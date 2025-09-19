#!/bin/bash
set -euo pipefail

mkdir -p "$DOWNLOAD_PATH"
git fetch origin "$BRANCH"
git "--work-tree=$DOWNLOAD_PATH" checkout "origin/$BRANCH" -- . || true
