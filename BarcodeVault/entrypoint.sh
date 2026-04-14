#!/bin/sh

set -e

# Data directory is provided by the HA supervisor as /data
# Ensure the database directory is ready
mkdir -p /data

# Configure the app to use HA's persistent data directory
export DB_PATH="/data/barcodevault.db"
export SETTINGS_PATH="/data/settings.json"
export DEPLOYMENT="hassio"
export PORT="5000"

echo "INFO: Starting BarcodeVault on port ${PORT}"
exec gunicorn \
    --bind "0.0.0.0:${PORT}" \
    --workers 2 \
    --timeout 30 \
    --preload \
    --access-logfile - \
    main:app
