set schema 'acctg';

-- https://www.postgresql.org/docs/12/app-psql.html
-- account_types
\copy account_types (account_type_id,name) from '/docker-entrypoint-initdb.d/csv/account_types.csv' with delimiter ',' csv header quote '"'

-- account_categories
\copy account_categories (acct_category_id,name,sub_name) from '/docker-entrypoint-initdb.d/csv/account_categories.csv' with delimiter ',' csv header quote '"'

-- invoice_types
\copy invoice_types (invoice_type_id,name) from '/docker-entrypoint-initdb.d/csv/invoice_types.csv' with delimiter ',' csv header quote '"'
