#!/bin/bash
set -e
[[ -n "${TARGET_BRANCH}" ]] || ( echo "TARGET_BRANCH undefined" >&2 && false )
[[ -n "${SOURCE_BRANCH}" ]] || ( echo "SOURCE_BRANCH undefined" >&2 && false )

echo "Target: ${TARGET_BRANCH}"
echo "Source: ${SOURCE_BRANCH}"

echo "Listing branches"
git branch -a

echo "Checking out base branch ${TARGET_BRANCH}"
git checkout ${TARGET_BRANCH}
echo "Checkout successful"

echo "Trying to merge origin/${SOURCE_BRANCH} to base ${TARGET_BRANCH}"
git merge origin/${SOURCE_BRANCH} --ff-only
echo "Merge succeeded"

echo "Trying to push"
git push
echo "Push succeeded"
