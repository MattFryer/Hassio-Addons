# BarcodeVault

A barcode scanning and product lookup service for Home Assistant. Receives barcode scans from ESPHome devices or other barcode scanning devices via webhooks or MQTT topics, looks up product information from online APIs (Open Food Facts, UPC Item DB, and more), and caches results in a local SQLite database.

Integrates well with Home Assistant using the BarcodeVault integration.

All settings are managed through the BarcodeVault web UI — open the app from the Home Assistant sidebar to configure API keys, MQTT, authentication, and more.

## Getting started

1. Start the app and open it from the Home Assistant sidebar (or navigate to `http://<ha-host>:5000`).
2. Configure your barcode lookup API providers in **Settings → Providers**.
3. Set up your ESPHome scanner to post barcodes to the webhook (see below).

## Home Assistant integration
There is a BarcodeVault integration to make working with Home Assistant as simple as possible. The integration exposes Actions (formerly known as Services) to Home Assistant, making it simple to perform a barcode lookup, add a product to the cache database, etc.



## REST API integration
It is also possible to integrate with Home Assistant using the REST API.

Add a `rest_command` to your Home Assistant `configuration.yaml` to forward scans from your ESPHome barcode scanner:

```yaml
rest_command:
  barcodevault_scan:
    url: "http://homeassistant.local:5000/webhook/scan"
    method: POST
    content_type: "application/json"
    payload: '{"barcode": "{{ barcode }}", "device": "{{ device }}"}'
```

Then create an automation to trigger it when your scanner reads a barcode:

```yaml
alias: "BarcodeVault — forward scan"
trigger:
  - platform: state
    entity_id: text_sensor.your_scanner_last_barcode
condition:
  - condition: template
    value_template: "{{ trigger.to_state.state not in ['', 'unknown', 'unavailable'] }}"
action:
  - service: rest_command.barcodevault_scan
    data:
      barcode: "{{ trigger.to_state.state }}"
      device:  "{{ trigger.to_state.attributes.friendly_name }}"
```

## MQTT integration

BarcodeVault can receive barcodes via MQTT and publish results back to a response topic. Configure the MQTT broker connection in **Settings → MQTT** within the web UI.

| Setting              | Default                    | Description                              |
|----------------------|----------------------------|------------------------------------------|
| Barcode Topic        | `barcodevault/scan`        | Topic to subscribe to for incoming scans |
| Response Topic       | `barcodevault/result`      | Topic to publish lookup results to       |

You can then post barcodes to the topic and monitor the response topic for the result.

## Ports

| Port  | Description                             |
|-------|-----------------------------------------|
| `5000`| BarcodeVault web interface and API      |

## Data storage

Your product database and settings are stored in the add-on's persistent data directory and survive restarts and updates.

The products can be exported and imported as a CSV file if needed. 
