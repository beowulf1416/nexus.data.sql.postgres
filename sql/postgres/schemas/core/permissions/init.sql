set schema 'permissions';


-- https://www.postgresql.org/docs/12/app-psql.html
-- permissions
\copy permissions (id,name,description) from '/docker-entrypoint-initdb.d/csv/permissions.csv' with delimiter ',' csv header quote '"'
