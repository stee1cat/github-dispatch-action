#!/bin/sh -l

ref=$(echo ${PAYLOAD_REF#refs/heads/})
data="{\"event_type\": \"${INPUT_EVENT_TYPE}\", \"client_payload\": {\"sender\": \"${INPUT_PAYLOAD_SENDER}\", \"ref\": \"${ref}\"}}"

echo "Send '${INPUT_EVENT_TYPE}' event to ${INPUT_EVENT_TARGET} with payload: '${data}'"
sh -c "curl -XPOST -H \"Accept: application/vnd.github.everest-preview+json\" \
  -H \"Content-Type: application/json\" \
  -H \"Authorization: token ${INPUT_ACCESS_TOKEN}\" \
  --data '${data}' -s \
  https://api.github.com/repos/${INPUT_EVENT_TARGET}/dispatches"
