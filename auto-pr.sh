#!/bin/bash

# Exit immediately on error
set -e

# Default to a unique branch name
BRANCH_NAME=${1:-"auto/solitaire-update-$(date +%s)"}
COMMIT_MSG=${2:-"chore: auto update for solitaire game @ $(date)"}

echo "🔧 Creating branch: $BRANCH_NAME"
git checkout -b $BRANCH_NAME

# 📝 Optional: make a placeholder change if needed
# Remove or replace this with real logic (e.g., asset updates, build version bumps)
echo "// Auto update made on $(date)" >> solitaire_update_log.js

echo "📦 Staging and committing changes..."
git add .
git commit -m "$COMMIT_MSG"

echo "🚀 Pushing branch to origin..."
git push -u origin $BRANCH_NAME

echo "📬 Creating pull request..."
gh pr create --base main --head $BRANCH_NAME \
  --title "$COMMIT_MSG" \
  --body "Automated PR created by auto-pr.sh for Solitaire Game"

echo "✅ Approving pull request..."
gh pr review --approve

echo "🔀 Merging pull request..."
gh pr merge --auto --squash --delete-branch

echo "🎉 Done! PR approved and merged."
