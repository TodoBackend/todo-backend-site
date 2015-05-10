#!/bin/bash
set -u -e

###############################################
# REQUIRED ENV VARS: 
#
# GITHUB_ORG_REPO COMMIT_SHA 
# STATUS_CONTEXT
# STATUS_PENDING_MESSAGE STATUS_PENDING_URL
# STATUS_SUCCESS_MESSAGE STATUS_SUCCESS_URL
# STATUS_FAILURE_MESSAGE STATUS_FAILURE_URL
#
###############################################

post_commit_status () {
  state=$1; shift
  description=$1; shift
  target_url=$1; shift

  api_url="https://api.github.com/repos/${GITHUB_ORG_REPO}/commits/${COMMIT_SHA}/statuses"

  api_body="{ \
    \"context\": \"${STATUS_CONTEXT}\", \
    \"state\": \"${state}\", \
    \"description\": \"${description}\", \
    \"target_url\": \"${target_url}\" }"

  curl -XPOST -H "Authorization: token $GITHUB_TOKEN" "$api_url" -d "$api_body"

  echo $state: $description
  echo $target_url
  echo
}

function post_pending_commit_status () {
  post_commit_status pending "${STATUS_PENDING_MESSAGE}" "${STATUS_PENDING_URL}"
}
function post_success_commit_status () {
  post_commit_status success "${STATUS_SUCCESS_MESSAGE}" "${STATUS_SUCCESS_URL}"
}
function post_failure_commit_status () {
  post_commit_status failure "${STATUS_FAILURE_MESSAGE}" "${STATUS_FAILURE_URL}"
}


function do_work_with_status_updates () {
  work_fn=$1; shift

  post_pending_commit_status
  (eval ${work_fn}) && post_success_commit_status || post_failure_commit_status
}

# EXAMPLE USAGE:



#function work () {
  #echo 'asdfsdf'
  #sleep 5
  #echo 'aa'
  #sleep 1
  #exit 1
#}
#do_work_with_status_updates work
