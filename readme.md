# Kodi (XBMC) MariaDB (MySQL) Docker image

> A simple image that runs a Kodi compatible MySQL (technically MariaDB) instance. See [the kodi wiki](http://kodi.wiki/view/MySQL).

## Usage

1. Have [Docker](https://www.docker.com) configured.
1. Clone this repository.
1. Run `docker-compose up -d`

Congrats! A MySQL instance is now running and ready for Kodi to connect.
Don't forget to update [advancedsettings.xml](http://kodi.wiki/view/MySQL/Setting_up_Kodi) as necessary. 
Typically something like:

```xml
<advancedsettings>
  <videodatabase>
    <type>mysql</type>
    <host>***.***.***.***</host>
    <port>3306</port>
    <user>kodi</user>
    <pass>kodi</pass>
  </videodatabase> 
  <musicdatabase>
    <type>mysql</type>
    <host>***.***.***.***</host>
    <port>3306</port>
    <user>kodi</user>
    <pass>kodi</pass>
  </musicdatabase>
  <videolibrary>
    <importwatchedstate>true</importwatchedstate>
    <importresumepoint>true</importresumepoint>
  </videolibrary>
</advancedsettings>
```

## Notes

This Dockerfile assumes you have an existing Kodi database dump (`./kodi-db.sql.gz`) to import when the container is built.
If you're starting from scratch, it may throw an error when it can't find the file (I haven't tried it yet). 
If it does, you should be able to `touch ./kodi-db.sql.gz` to suppress the error.

`docker-compose` is configured to mount `/srv/docker/kodimariadb/data` to `/var/lib/mysql` in order to persist the database and make it easily accessible.
It also automatically configures the container to listen on port 3306.
These can be changed in `./docker-compose.yml`.
