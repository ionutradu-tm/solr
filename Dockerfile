FROM solr

USER root
RUN export SOLR_HOST=$HOST
USER solr
