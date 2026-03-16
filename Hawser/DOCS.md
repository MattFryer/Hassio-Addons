# Hawser

Docker stack deployment and management service, giving Dockhand access to your Home Assistant environment.

## Security Note
For Hawser to be able to monitor and manage your Home Assistant Supervisor containers, it needs access to the Docker socket of the host environment. This give Hawser full access to start, stop or modify any container running on the host, including Home Assistant itself.

## Protection mode
Protection mode must be **disabled** for this App in order for it to have access to the host docker environment.

## Configuration

| Option  | Required | Description |
|---------|----------|-------------|
| `token` | Yes      | Secret token used to authenticate API requests from Dockhand. Must be changed from default value. |

## Ports

| Option  | Required | Description |
|---------|----------|-------------|
| `port`  | Yes      | Hawser Docker management API port. Defaults to `2376` |