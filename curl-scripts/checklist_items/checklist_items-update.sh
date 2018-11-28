#!/bin/bash

curl --include --request POST "http://localhost:4741/checklist_items/${ID}" \
  --header "Content-type: application/json" \
  --data '{
  --header "Authorization: Token token=${TOKEN}" \
    "checklist_items": {
      "priority": "'"${INT}"'",
      "text": "'"${TEXT}"'"
      "finished": "'"${BOOLEAN}"'"
    }
  }'
