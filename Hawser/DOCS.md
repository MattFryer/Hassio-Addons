# Hawser

Docker stack deployment and management service, accessible via a remote API.

## Configuration

| Option  | Required | Description |
|---------|----------|-------------|
| `token` | Yes      | Secret token used to authenticate API requests |

## Ports

| Port   | Description |
|--------|-------------|
| `2376` | Hawser Docker management API |

## Data

Stack definitions are stored in `/share/hawser/stacks` on the Home Assistant host,
so they persist across add-on restarts and updates.

## Security Note

This add-on uses `docker_api: true` which grants it access to the host Docker socket.
This gives it significant control over the host system. Only install from trusted sources
and ensure your `token` is set to a strong, unique value.
