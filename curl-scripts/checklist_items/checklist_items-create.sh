#!/bin/bash

curl --include --request POST "http://localhost:4741/checklist_items" \
  --header "Content-type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "checklist_item": {
      "priority": "'"${INT}"'",
      "text": "'"${TEXT}"'",
      "finished": "'"${BOOLEAN}"'"
    }
  }'
