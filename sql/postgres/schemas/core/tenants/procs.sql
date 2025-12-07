set schema 'tenants';



\ir procs/tenants/tenant_save.sql
\ir procs/tenants/tenant_set_active.sql
\ir procs/tenants/tenants_set_active.sql
\ir procs/tenants/tenants_fetch_by_id.sql
\ir procs/tenants/tenants_fetch.sql

\ir procs/tenant_users/tenant_users_fetch.sql
\ir procs/tenant_users/tenant_user_save.sql
\ir procs/tenant_users/tenant_users_assign.sql
\ir procs/tenant_users/tenant_user_fetch_tenants.sql
\ir procs/tenant_users/tenant_user_fetch_permissions.sql


\ir procs/roles/role_save.sql
\ir procs/roles/roles_fetch.sql

\ir procs/role_users/role_users_add.sql
\ir procs/role_users/role_users_remove.sql

\ir procs/role_permissions/role_permissions_add.sql
\ir procs/role_permissions/role_permissions_remove.sql