#!/bin/bash
set -e

# EXAMPLE USAGE: 
# cd deployment-tooling
# GITHUB_TOKEN=$STATUS_TOKEN GITHUB_ORG_REPO="moredip/Spoon-Knife" COMMIT_SHA="0f1c345fb892a8db8687e4f27f3808d1e0089461" ./deploy-preview.sh

STATUS_CONTEXT='todobackend-deploy-preview'

STATUS_PENDING_MESSAGE='deploying to preview.todobackend.com'
STATUS_PENDING_URL="http://preview.todobackend.com"

STATUS_SUCCESS_MESSAGE='deployed to preview.todobackend.com'
STATUS_SUCCESS_URL='http://preview.todobackend.com'

STATUS_FAILURE_MESSAGE='failed to deploy to preview.todobackend.com'
STATUS_FAILURE_URL=''

set -u

source './github-commit-status-helpers.sh'

function work () {
  cd ..
  bundle exec rake deploy_preview
}

do_work_with_status_updates work
