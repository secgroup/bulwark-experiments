# Auth Server - Artificial IdP

## Set-Up

```sh
docker build -t auth-server:latest .
docker run -p 443:443 -e MONGO_HOST=127.0.0.1 auth-server:latest
```

## Users

- `alberto.lupo@null.net:qwerty`
