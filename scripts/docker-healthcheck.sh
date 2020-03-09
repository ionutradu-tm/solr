#!/bin/bash

PORT=${PORT:-8984}

for COLLECTION in ${COLLECTIONS}
do
  echo -n "Checking collection ${COLLECTION} "
  STATUS=$(/opt/solr/bin/solr  healthcheck -c essentraCatalogCollection4 | jq '.shards[0].replicas[] | select(.url| contains("'"${HOST}"'")) | .status' | tr -d \")
  echo ${STATUS}
  if [[ ${STATUS} != "active" ]]; then
    NOT_HEALTHY=1
  fi
done
if [[ -n ${NOT_HEALTHY} ]];then
  exit 1
fi