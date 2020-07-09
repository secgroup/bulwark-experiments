# osCommerce 2.3.1 Docker

## Set-Up

```sh
docker build -t oscommerce:2.3.1 .
docker run --rm -ti -p 80:80 -e APPHOST=localhost -e APPPORT=80 -e APPHTTP=http oscommerce:2.3.1
```

Note: These steps are executed by the `docker-compose.paypal.yml` file in the parent directory

## Users

- Admin: `toto:toto`
- Users: `user1@example.com:user1pass`
