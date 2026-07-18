set schema 'acctg';


-- account_types
\ir procs/account_types/account_types_fetch.sql

-- account_categories
\ir procs/account_categories/account_categories_fetch.sql

-- accounts
\ir procs/accounts/accounts_fetch_all.sql
\ir procs/accounts/accounts_fetch_by_type.sql
\ir procs/accounts/accounts_fetch.sql
\ir procs/accounts/account_fetch.sql
\ir procs/accounts/account_fetch_by_name.sql
\ir procs/accounts/account_fetch_children.sql
\ir procs/accounts/accounts_fetch_tree.sql

\ir procs/accounts/account_save.sql

-- account hierarchy
\ir procs/account_hierarchy/account_hierarchy_save.sql


-- invoice types
\ir procs/invoice_types/invoice_types_fetch.sql

-- invoices
\ir procs/invoices/invoices_fetch.sql
\ir procs/invoices/invoice_fetch.sql
\ir procs/invoices/invoice_save.sql
