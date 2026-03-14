ARG BASE=ghcr.io/finsys/hawser:latest
FROM ${BASE}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
