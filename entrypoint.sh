#!/bin/bash
set -e
echo "Target: ${GITHUB_BASE_REF}"
echo "Source: ${GITHUB_HEAD_REF}"

echo "Listing branches"
git branch -a
echo "Setup tracking branch"
git branch --track ${GITHUB_HEAD_REF} origin/${GITHUB_HEAD_REF}
echo "Tracking branch setup"
echo "Listing branches again"
git branch -a
echo "Trying to merge(3) ${GITHUB_HEAD_REF} to base ${GITHUB_BASE_REF}"
git merge ${GITHUB_HEAD_REF} --ff-only
echo "Merge succeeded"
echo "Trying to push"
git push
echo "Push succeeded"
