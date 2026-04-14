# Grab the upstream BarcodeVault image
ARG BASE=mattfryer/barcodevault:1.0.0
FROM ${BASE}

# Add HA ingress WSGI wrapper and replace the entrypoint with the HA-specific one
COPY hassio_wsgi.py /app/hassio_wsgi.py
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
