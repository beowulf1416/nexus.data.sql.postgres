FROM postgres:latest
LABEL maintainer="Ferd Tomale<beowulf1416@gmail.com>"


# ENV POSTGRES_USER=app_user \
#    POSTGRES_PASSWORD=replace_me \
#    POSTGRES_DB=eas

EXPOSE 5432

RUN <<EOT
    mkdir -p /docker-entrypoint-initdb.d
EOT

COPY ./postgres /docker-entrypoint-initdb.d/