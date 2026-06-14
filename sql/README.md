docker commands:

docker build -t nexus.db .
docker run --env-file .env -p 5432:5432 --name nexus.db nexus.db



podman commands:

podman volume create pgdata
podman run -d \
    --name nexus.db \
    --env-file .env \
    --hostname nexus.db \
    --ip 10.0.0.1 \
    -p 5432:5432 \
    -v ./postgres:/docker-entrypoint-initdb.d \
    -v pgdata:/var/lib/postgresql/data \
    nexus.db

podman build -t nexus.db .
podman run -d \
    --name nexus.db \
    --env-file .env \
    --hostname nexus.db \
    -p 5432:5432 \
    nexus.db

podman exec -it nexus.db psql -U app_user -d eas


podman start nexus.db


psql -U app_user -h localhost eas
