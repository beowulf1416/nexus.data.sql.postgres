docker commands:

docker build -t nexus.db .
docker run --env-file .env --name nexus.db nexus.db