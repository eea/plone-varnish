FROM eeacms/varnish:7.4-1.1
LABEL maintainer="IDM2 A-Team <eea-edw-a-team-alerts@googlegroups.com>"

ENV VARNISH_SIZE="2G" 
ENV VARNISH_BACKEND="haproxy"
ENV VARNISH_BACKEND_PORT="8080"
ENV VARNISH_DNS_TTL=20s
ENV VARNISH_GZIP_ENABLED="false"
ENV VARNISH_GZIP_JSON_ENABLED="false"

CMD ["-p", "thread_pools=8", "-p", "thread_pool_timeout=120", "-p", "thread_pool_add_delay=0.002", "-p", "ban_lurker_sleep=0.1", "-p", "send_timeout=3600", "-p", "connect_timeout=2s", "-p", "first_byte_timeout=300s", "-p", "between_bytes_timeout=60s"]

COPY varnish.vcl /etc/varnish/default.vcl
