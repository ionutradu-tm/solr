#!/bin/bash

export SOLR_HOST=$HOST
JUTE_MAXBUFFER=${JUTE_MAXBUFFER:-0x20000000}
export SOLR_OPTS="${SOLR_OPTS} -Djute.maxbuffer=${JUTE_MAXBUFFER}"

cp -ra /opt/solr/server/solr_orig/* /opt/solr/server/solr/.

