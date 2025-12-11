set schema 'permissions';


-- https://www.postgresql.org/docs/12/app-psql.html
-- permissions

-- temporarily create sequence to add records to permissions table
create sequence if not exists seq_permissions as int
;

alter table if exists permissions
alter column id set default nextval('seq_permissions')
;


\copy permissions (name,description) from '/docker-entrypoint-initdb.d/csv/permissions.csv' with delimiter ',' csv header quote '"'

alter table if exists permissions
alter column id drop default
;

drop sequence seq_permissions
;