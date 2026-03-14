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
export DOCKER_SOCKET="/var/run/docker.sock"

# Map persistent stacks storage from HA shared folder into expected path
mkdir -p /share/hawser/stacks
ln -sf /share/hawser/stacks /data/stacks

echo "INFO: Starting Hawser on port ${PORT}"

exec /usr/local/bin/hawser
