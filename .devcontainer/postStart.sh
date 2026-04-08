#!/bin/bash
set -e

# Ensure upstream remote is configured
if ! git remote get-url upstream &>/dev/null; then
  echo "upstream remote not found — adding https://github.com/nasaul/mineria_datos.git"
  git remote add upstream https://github.com/nasaul/mineria_datos.git
fi

# Sync fork with upstream
echo "Fetching upstream..."
git fetch upstream
BRANCH=$(git rev-parse --abbrev-ref HEAD)
git merge upstream/"$BRANCH" --no-edit || echo "Merge not needed or conflict — skipping."

# Pull latest changes from origin
git pull || true
