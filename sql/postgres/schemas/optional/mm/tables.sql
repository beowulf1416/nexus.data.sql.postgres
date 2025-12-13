set schema 'mm'
\echo 'switch to mm schema';
\echo :SCHEMA



\echo 'warehouses';
\ir tables/warehouses.sql

\echo 'locations';
\ir tables/locations.sql

\echo 'items';
\ir tables/items.sql
\echo 'item_balances';
\ir tables/item_balances.sql

\echo 'item_locations';
\ir tables/item_locations.sql

\echo 'mm tables created';