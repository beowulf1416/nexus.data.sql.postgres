#!/bin/bash

podman stop nexus.db
podman rm nexus.db
podman image rm nexus.db
podman build -t nexus.db .
podman run -d --name nexus.db --hostname nexus.db --env-file .env -p 5432:5432 nexus.db

sleep 10

podman ps -a
