FROM solr
COPY ./scripts/export_solrthost.sh /docker-entrypoint-initdb.d/
COPY ./scripts/set_solrhost.sh /docker-entrypoint-initdb.d/
USER root
RUN chmod +x /docker-entrypoint-initdb.d/*.sh
user solr
