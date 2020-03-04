FROM solr:8
COPY ./scripts/export_solrthost.sh /docker-entrypoint-initdb.d/
COPY ./scripts/set_solrhost.sh /docker-entrypoint-initdb.d/
COPY ./solr /opt/solr/server/solr_orig
COPY ./scripts/docker-healthcheck.sh /
USER root
RUN chmod +x /docker-entrypoint-initdb.d/*.sh
RUN chmod +x /docker-healthcheck.sh
RUN chown -R solr /opt/solr/server/solr 
USER solr
