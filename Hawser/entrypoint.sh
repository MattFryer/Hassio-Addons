#!/bin/sh
 
set -e
 
# Read token from Home Assistant options
OPTIONS_FILE=/data/options.json
if [ -f "${OPTIONS_FILE}" ]; then
    TOKEN="$(grep -o '"token": *"[^"]*"' "${OPTIONS_FILE}" | grep -o '"[^"]*"$' | tr -d '"')"
fi
 
if [ -z "${TOKEN}" ]; then
    echo "ERROR: No token configured. Set a token in the add-on configuration."
    exit 1
fi

if [ "${TOKEN}" = "your-secret-token" ]; then
    echo "ERROR: Token has not been changed from the default. Set a unique secret token in the add-on configuration before starting."
    exit 1
fi

if [ ! -S "/run/docker.sock" ]; then
    echo "ERROR: Docker socket not found at /run/docker.sock."
    echo "ERROR: To fix this, go to the Hawser app (formerly add-on) page in Home Assistant, scroll down to 'Protection mode' and disable it, then restart the add-on."
    exit 1
fi
 
export TOKEN="${TOKEN}"
export PORT="2376"
export BIND_ADDRESS="0.0.0.0"
export DOCKER_SOCKET="/run/docker.sock"
 
# Store stacks in HA shared storage so they persist across restarts
mkdir -p /share/hawser/stacks
ln -sf /share/hawser/stacks /data/stacks
 
echo "INFO: Starting Hawser on port ${PORT}"
 
exec /usr/local/bin/hawser
