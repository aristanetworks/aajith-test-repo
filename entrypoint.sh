#!/bin/bash
set -e
echo "Target: ${GITHUB_BASE_REF}"
echo "Source: ${GITHUB_HEAD_REF}"

echo "Trying to merge(2) ${GITHUB_HEAD_REF} to base ${GITHUB_BASE_REF}"
git merge origin/${GITHUB_HEAD_REF} --ff-only
echo "Merge succeeded"
echo "Trying to push"
git push
echo "Push succeeded"
