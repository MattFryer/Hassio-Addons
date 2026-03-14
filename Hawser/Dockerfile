ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install bashio dependencies if not already present
RUN apk add --no-cache bash curl jq

# Copy the run script
COPY rootfs /

# Make run script executable
RUN chmod +x /etc/services.d/hawser/run

CMD ["/init"]
