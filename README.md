# cc

Computer Craft scripts.

## Setup

Add the following to `computercraft-server.toml` under `[http]` to enable localhost:

```toml
[[http.rules]]
	host = "127.0.0.1/8"
	action = "allow"
```

## Hosting

Server and client is modified versions of https://github.com/WaimateWihongi/ComputerCraft-LocalHost.

### Server

Host local files:

```bash
make host
```

### Client

```
pastebin get 5YqgMWrX localhost
```

Pastebin link: https://pastebin.com/5YqgMWrX.
