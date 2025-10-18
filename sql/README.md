docker commands:

docker build -t nexus.db .
docker run --env-file .env -p 5432:5432 --name nexus.db nexus.db