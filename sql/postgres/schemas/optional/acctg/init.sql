set schema 'acctg';

-- https://www.postgresql.org/docs/12/app-psql.html
-- invoice_types
\copy invoice_types (invoice_type_id,name) from '/docker-entrypoint-initdb.d/csv/invoice_types.csv' with delimiter ',' csv header quote '"'
