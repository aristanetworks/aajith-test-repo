#!/bin/bash
set -e

function try_merge {
   echo "Target: ${TARGET_BRANCH}"
   echo "Source: ${SOURCE_BRANCH}"
   
   echo "Listing branches"
   git branch -a
   
   echo "Checking out base branch ${TARGET_BRANCH}"
   git checkout "${TARGET_BRANCH}"
   echo "Checkout successful"
   
   echo "Trying to merge origin/${SOURCE_BRANCH} to base ${TARGET_BRANCH}"
   git merge "origin/${SOURCE_BRANCH}" --ff-only
   echo "Merge succeeded"
   
   echo "Trying to push"
   git push
   echo "Push succeeded"
}

function get_branches_from_pr_url {
   PR_DATA=$(curl -H "Accept: application/vnd.github.v3+json" \
                  -H "Authorization: token ${GITHUB_TOKEN}" \
                  "${PR_URL}")
   TARGET_BRANCH=$(echo ${PR_DATA} | jq .base.ref)
   SOURCE_BRANCH=$(echo ${PR_DATA} | jq .head.ref)
}

function main {
   if [[ -n "${PR_URL}" ]]
   then
      get_branches_from_pr_url
   fi
   [[ -n "${TARGET_BRANCH}" ]] || ( echo "TARGET_BRANCH undefined" >&2 && false )
   [[ -n "${SOURCE_BRANCH}" ]] || ( echo "SOURCE_BRANCH undefined" >&2 && false )
   try_merge
}

main
