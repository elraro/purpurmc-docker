# purpurmc-docker for arm64
Very basic, unofficial docker image for [purpurmc](https://purpurmc.org/).

## Usage Example
```
docker run -v "/host/purpur:/opt/purpur" -e EULA=true -e UPDATE=true -e MEMORY=2G ghcr.io/elraro/purpurmc-docker
```
- default version is 1.19.3
- `EULA=true` is required
- `UPDATE=true` always downloads the latest purpurmc build on startup
- root user not recommended, see below

## Run as unprivileged user
1. `useradd --no-create-home -s /sbin/nologin -U minecraft`
2. `mkdir -p /opt/purpur`
3. `chown -R minecraft:minecraft /opt/minecraft`
4. set env variables `UID` and `GUID` on startup\
   (see `id [-u/-g] minecraft`)

## Example docker-compose
 ```
 version: '3.8'

services:
  purpurmc:
    image: ghcr.io/elraro/purpurmc-docker
    environment:
      - EULA=true
      - GID=1003
      - UID=1003
      - VERSION=1.19.3
      - UPDATE=true
      - MEMORY=8G
    volumes:
      - /opt/purpur/:/opt/purpur/
    ports:
      - 25565:25565
    restart: unless-stopped
```
