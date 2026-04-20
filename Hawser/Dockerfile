# Grab the upstream Hawser image
ARG BASE=ghcr.io/finsys/hawser:0.2.40
FROM ${BASE}

# Replace the entrypoint with the one from this repo
COPY entrypoint.sh /entrypoint.sh

# Make sure the permissions on the entrypoint file are correct
RUN chmod +x /entrypoint.sh

# Run the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
