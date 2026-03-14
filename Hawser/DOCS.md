# Hawser - Home Assistant Add-on

Docker stack deployment and management service, packaged as a Home Assistant add-on.

## Installation

1. Add this repository to your Home Assistant add-on store.
2. Install the **Hawser** add-on.
3. Set your `token` in the add-on configuration.
4. Start the add-on.

## Configuration

| Option  | Required | Description                          |
|---------|----------|--------------------------------------|
| `token` | Yes      | Secret token for authenticating API requests |

## Ports

| Port   | Description              |
|--------|--------------------------|
| `2376` | Hawser Docker management API |

## Data

Stacks are persisted to `/share/hawser/stacks` on the Home Assistant host.

## Notes

This add-on requires `docker_api: true` to mount the Docker socket, which gives it
full access to the host Docker daemon. Only install from trusted sources.
