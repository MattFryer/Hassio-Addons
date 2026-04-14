# Grab the upstream BarcodeVault image
ARG BASE=mattfryer/barcodevault:1.0.0
FROM ${BASE}

# Replace the entrypoint with the HA-specific one
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
