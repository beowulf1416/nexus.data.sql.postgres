create extension if not exists pgcrypto;
create extension if not exists "uuid-ossp";

-- schemas
\ir schemas/core/common/schema.sql
\ir schemas/core/tenants/schema.sql
\ir schemas/core/users/schema.sql
\ir schemas/core/auth/schema.sql


\ir schemas/optional/user_registration/schema.sql


-- tables
\ir schemas/core/common/tables.sql
\ir schemas/core/tenants/tables.sql
\ir schemas/core/users/tables.sql
\ir schemas/core/auth/tables.sql


\ir schemas/optional/user_registration/tables.sql


-- procs
\ir schemas/optional/user_registration/procs.sql