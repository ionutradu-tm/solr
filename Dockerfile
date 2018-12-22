FROM solr
COPY ./scripts /scripts
USER root
RUN chmod +x /scripts/*.sh
USER solr
ENTRYPOINT ["/scripts/export_solrthost.sh"]
