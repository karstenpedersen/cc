# cc

Computer Craft scripts.

## Setup

Add the following to `computercraft-server.toml` under `[http]` to enable localhost:

```toml
[[http.rules]]
	host = "127.0.0.1/8"
	action = "allow"
```

Host local files:

```bash
make host
```

