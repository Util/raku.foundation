#!/bin/bash

#/path/to/your/docker-compose-folder
cd /my_webapp || exit

docker compose pull
docker compose up -d
docker image prune -f

#sudo crontab -e
#*/15 * * * * /my_webapp/update-sites.sh >> /var/log/update-sites.log 2>&1