#!/bin/bash
set -e
echo "Target: ${GITHUB_BASE_REF}"
echo "Source: ${GITHUB_HEAD_REF}"

echo "Trying to merge ${GITHUB_HEAD_REF} to base ${GITHUB_BASE_REF}"
git merge ${GITHUB_HEAD_REF} --ff-only
echo "Trying to push"
git push
