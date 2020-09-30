#!/bin/bash
docker-compose down;
docker container rm -f $(docker container list -qa);
#docker image rmi $(docker image list -qa);
#docker system prune --force --volumes;
docker-compose up;