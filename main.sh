#!/bin/bash
set -euo pipefail

DOWNLOAD_PATH="${DOWNLOAD_PATH:-$GITHUB_WORKSPACE}"
mkdir -p "$DOWNLOAD_PATH"
git fetch origin "$BRANCH"
git "--work-tree=$DOWNLOAD_PATH" checkout "origin/$BRANCH" -- . || true
