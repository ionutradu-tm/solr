FROM solr
COPY ./scripts/export_solrthost.sh /docker-entrypoint-initdb.d/
COPY ./scripts/set_solrhost.sh /docker-entrypoint-initdb.d/
COPY /opt/solr/server/solr /opt/solr/server/solr_orig
USER root
RUN chmod +x /docker-entrypoint-initdb.d/*.sh
USER solr