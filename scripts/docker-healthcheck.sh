#!/bin/bash

PORT=${PORT:-8984}

for COLLECTION in ${COLLECTIONS}
do
  echo -n "Checking collection ${COLLECTION} "
  STATUS=$(curl -sf http://localhost:${PORT}/solr/${COLLECTION}/admin/ping?wt=json | jq .status | tr -d \")
  echo ${STATUS}
  if [[ ${STATUS} != "OK" ]]; then
    NOT_HEALTHY=1
  fi
done
if [[ -n ${NOT_HEALTHY} ]];then
  exit 1
fi