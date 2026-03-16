#!/bin/sh
 
set -e
 
# Read token from Home Assistant options
OPTIONS_FILE=/data/options.json
if [ -f "${OPTIONS_FILE}" ]; then
    TOKEN="$(grep -o '"token": *"[^"]*"' "${OPTIONS_FILE}" | grep -o '"[^"]*"$' | tr -d '"')"
fi

# Check that the token isn't empty
if [ -z "${TOKEN}" ]; then
    echo "ERROR: No token configured. Set a token in the add-on configuration."
    exit 1
fi

# Check that the token has been changed from the default placeholder
if [ "${TOKEN}" = "your-secret-token" ]; then
    echo "ERROR: Token has not been changed from the default. Set a unique secret token in the add-on configuration before starting."
    exit 1
fi

# Check that the docker socket is accessible from within the App
if [ ! -S "/run/docker.sock" ]; then
    echo "ERROR: Docker socket not found at /run/docker.sock."
    echo "ERROR: To fix this, go to the Hawser app (formerly add-on) page in Home Assistant, scroll down to 'Protection mode' and disable it, then restart the add-on."
    exit 1
fi
 
# Make the config available
export TOKEN="${TOKEN}"
export PORT="2376" # The port Hawser will listen on. This is the port internal to the App's container and will be mapped to the port set in the configuration
export BIND_ADDRESS="0.0.0.0" # Used to make sure the port is bound to the external IP of HA and not just the loop back IP
export DOCKER_SOCKET="/run/docker.sock" # The path to the Docker socket
 
# Store stacks in HA shared storage so they persist across restarts
mkdir -p /share/hawser/stacks
ln -sf /share/hawser/stacks /data/stacks

# Start Hawser 
echo "INFO: Starting Hawser on port ${PORT}"
exec /usr/local/bin/hawser
