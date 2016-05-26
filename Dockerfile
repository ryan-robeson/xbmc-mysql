# docker build -t robeson/kodi-mariadb .
# Run like "docker run -d -p 3306:3306 robeson/kodi-mariadb"
from library/mariadb:10.1.14
maintainer Ryan Robeson "ryan.robeson@gmail.com"

COPY xbmc.sql /docker-entrypoint-initdb.d/01-xbmc.sql
COPY kodi-db.sql.gz /docker-entrypoint-initdb.d/02-kodi-db.sql.gz

