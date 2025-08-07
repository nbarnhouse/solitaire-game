#!/bin/bash

# Stop on first error
set -e

# Customize this
BRANCH_NAME="auto/update-$(date +%s)"
COMMIT_MSG="Automated PR: update at $(date)"

# 1. Create and switch to a new branch
git checkout -b $BRANCH_NAME

# 2. Make your changes here (this example adds a timestamp file)
echo "Auto update: $(date)" > timestamp.txt

# 3. Stage and commit changes
git add .
git commit -m "$COMMIT_MSG"

# 4. Push to GitHub
git push -u origin $BRANCH_NAME

# 5. Create PR
gh pr create --base main --head $BRANCH_NAME --title "$COMMIT_MSG" --body "Automated PR for $BRANCH_NAME"

# 6. Approve PR (optional)
gh pr review --approve

# 7. Merge PR and delete branch
gh pr merge --auto --squash --delete-branch
