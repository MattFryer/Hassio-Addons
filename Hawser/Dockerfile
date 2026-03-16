ARG BASE=ghcr.io/finsys/hawser:0.2.37
FROM ${BASE}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
