#!/bin/bash
# One-shot publish to GitHub Pages. Run after `gh auth login --web`.
set -e
cd "$(dirname "$0")"
gh repo create dsv-symposium --public --source=. --remote=origin --push
OWNER=$(gh api user -q .login)
gh api -X POST "repos/$OWNER/dsv-symposium/pages" \
  -f "source[branch]=main" -f "source[path]=/" || true
echo
echo "Site will be live in ~1 minute at:"
echo "  https://$OWNER.github.io/dsv-symposium/"
