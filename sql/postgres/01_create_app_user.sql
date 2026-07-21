create user app_user with password 'replace_me';


grant usage on schema common to app_user;
grant select on all tables in schema common to app_user;

grant usage on schema permissions to app_user;
grant select on all tables in schema permissions to app_user;

grant usage on schema auth to app_user;
grant select, insert, update on all tables in schema auth to app_user;

-- grant select, insert, update on all tables in schema documents to app_user;

grant usage on schema files to app_user;
grant select, insert, update on all tables in schema files to app_user;

grant usage on schema organizations to app_user;
grant select, insert, update on all tables in schema organizations to app_user;

grant usage on schema tenants to app_user;
grant select, insert, update on all tables in schema tenants to app_user;

grant usage on schema users to app_user;
grant select, insert, update on all tables in schema users to app_user;

grant usage on schema acctg to app_user;
grant select, insert, update on all tables in schema acctg to app_user;

grant usage on schema crm to app_user;
grant select, insert, update on all tables in schema crm to app_user;

grant usage on schema user_registration to app_user;
grant select, insert, update on all tables in schema user_registration to app_user;


revoke insert, update on auth.auth_types from app_user;
