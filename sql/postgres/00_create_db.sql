create extension if not exists pgcrypto;
create extension if not exists "uuid-ossp";

-- schemas
\ir schemas/core/common/schema.sql
\ir schemas/core/permissions/schema.sql
\ir schemas/core/users/schema.sql
\ir schemas/core/tenants/schema.sql
\ir schemas/core/auth/schema.sql
\ir schemas/core/documents/schema.sql


\ir schemas/optional/user_registration/schema.sql
\ir schemas/optional/organizations/schema.sql
\ir schemas/optional/employees/schema.sql
\ir schemas/optional/mm/schema.sql
\ir schemas/optional/work/schema.sql

-- tables
\ir schemas/core/common/tables.sql
\ir schemas/core/permissions/tables.sql
\ir schemas/core/users/tables.sql
\ir schemas/core/tenants/tables.sql
\ir schemas/core/auth/tables.sql
\ir schemas/core/documents/tables.sql


\ir schemas/optional/user_registration/tables.sql
\ir schemas/optional/organizations/tables.sql
\ir schemas/optional/employees/tables.sql
\ir schemas/optional/mm/tables.sql
\ir schemas/optional/work/tables.sql


-- procs
\ir schemas/core/common/procs.sql
\ir schemas/core/permissions/procs.sql
\ir schemas/core/tenants/procs.sql
\ir schemas/core/users/procs.sql
\ir schemas/core/auth/procs.sql

\ir schemas/optional/mm/procs.sql
\ir schemas/optional/user_registration/procs.sql



-- init
\ir schemas/core/common/init.sql
\ir schemas/core/permissions/init.sql
\ir schemas/core/tenants/init.sql
\ir schemas/core/auth/init.sql


\ir schemas/optional/employees/init.sql