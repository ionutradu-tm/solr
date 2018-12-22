FROM solr
COPY ./scripts /.
USER root
RUN chmod +x /scripts/*.sh
USER solr
ENTRYPOINT ["/scripts/export_solrthost.sh"]
