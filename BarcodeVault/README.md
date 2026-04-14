# BarcodeVault

A barcode scanning and product lookup service for Home Assistant. Receives barcode scans from ESPHome devices or other barcode scanning devices via webhooks or MQTT topics, looks up product information from online APIs (Open Food Facts, UPC Item DB, and more), and caches results in a local SQLite database.

Integrates well with Home Assistant using the BarcodeVault integration.

## Features

- API and MQTT endpoints for receiving barcode scans from ESPHome devices
- Lookup across multiple barcode databases with configurable priority
- Local SQLite cache to avoid repeated API calls
- Web UI for browsing the product database and managing settings
- Optional authentication with MFA support
- Audit log and scan history
- Fully documented API for integration with other tools and services

## Installation
1. Please first follow the instructions to [install the repository into your Home Assistant App store](/README.md#installation)
2. Search for "BarcodeVault" in the Home Assistant App store or alternatively click the below button:

    [![Open your Home Assistant instance and show the dashboard of an app.](https://my.home-assistant.io/badges/supervisor_addon.svg)]()

3. Install the App 
4. Open the app from the Home Assistant sidebar to configure API keys, MQTT, authentication, and more.

## Documentation

See the [full documentation](DOCS.md) for setup instructions and ESPHome integration examples.
