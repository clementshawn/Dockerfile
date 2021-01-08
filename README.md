# Yearning

This image builds from official binary pack.

# Tags

Only `latest` tag is available, current version is `2.3.1`.

# How

## Start an instance

Just run it:

```shell
$ docker run -d --network some-network --name my-yearning \
    -e MYSQL_HOST=some-mysql \
    -e MYSQL_USER=someone \
    -e MYSQL_PASSWORD=someone-pw \
    -p 8000:8000 \
    cshawn/yearning:latest
```

## Environment Variables

To start a yearning instance, you need to prepare a mysql database that must be 5.7 or above, and the character set should be UTF8mb4.

### `MYSQL_HOST`, `MYSQL_USER`, `MYSQL_PASSWORD`

These variables are mandatory, yearning runs based a mysql database.

### `MYSQL_DATABASE`

This variable is optional, if you do not set a value, the default value is set to be `Yearning`.

### `MYSQL_PORT`

This variable is optional, the default value is `3306`.

### `SECRETKEY`

This variable is optional, the value is  a database encryption and decryption key that can be set before running.
