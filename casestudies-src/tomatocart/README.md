# TomatoCart 1.1.5 Docker

## Set-Up

```sh
docker build -t tomatocart:1.1.5 .
docker run --rm -ti -p 80:80 -e APPHOST=localhost -e APPPORT=80 -e APPHTTP=http tomatocart:1.1.5
```

## Users

- Admin: `toto:toto`
- Users: `user1@example.com:user1pass`

