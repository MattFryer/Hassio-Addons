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
 
export TOKEN="${TOKEN}"
export PORT="2376"
export BIND_ADDRESS="0.0.0.0"
export DOCKER_SOCKET="/run/docker.sock"
 
# Store stacks in HA shared storage so they persist across restarts
mkdir -p /share/hawser/stacks
ln -sf /share/hawser/stacks /data/stacks
 
echo "INFO: Starting Hawser on port ${PORT}"
 
exec /usr/local/bin/hawser
