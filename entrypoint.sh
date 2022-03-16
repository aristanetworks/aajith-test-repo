#!/bin/bash
set -e
echo "Target: ${GITHUB_BASE_REF}"
echo "Source: ${GITHUB_HEAD_REF}"

echo "Listing branches"
git branch -a
echo "Checking out base branch ${GITHUB_BASE_REF}"
git checkout ${GITHUB_BASE_REF}
echo "Checkout successful"
echo "Trying to merge(3) origin/${GITHUB_HEAD_REF} to base ${GITHUB_BASE_REF}"
git merge origin/${GITHUB_HEAD_REF} --ff-only
echo "Merge succeeded"
echo "Trying to push"
git push
echo "Push succeeded"
