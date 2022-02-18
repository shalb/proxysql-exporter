FROM busybox:1.35.0

RUN echo 'my_user:x:1000:1000:my_user:/opt/proxysql_exporter:/bin/sh' >> /etc/passwd
RUN mkdir -p /opt/proxysql_exporter
WORKDIR /opt/proxysql_exporter
ADD https://github.com/percona/proxysql_exporter/releases/download/v1.1.2/proxysql_exporter_linux_amd64.tar.gz ./
RUN /bin/tar -xzf proxysql_exporter_linux_amd64.tar.gz && \
chmod 755 proxysql_exporter && \
rm -f proxysql_exporter_linux_amd64.tar.gz

USER my_user

ENTRYPOINT ["/opt/proxysql_exporter/proxysql_exporter"]
