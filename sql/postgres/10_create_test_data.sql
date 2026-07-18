\ir ./test_data/01_tenant_01.sql
\ir ./test_data/02_user_01.sql
\ir ./test_data/03_role_01.sql

-- acctg
\ir ./test_data/acctg/add_accounts.sql

-- crm
\ir ./test_data/crm/add_crm_partners.sql


set search_path to permissions, public;

create procedure create_test_accounts_1()
language plpgsql
as $$
declare
    user_id uuid;
    tenant_id_default uuid;
    tenant_id_1 uuid;
    tenant_id_2 uuid;
    role_id_default uuid;
    role_id_1 uuid;
    role_id_2 uuid;
    permission_id_1 int;
    permission_id_2 int;
    permission_id_3 int;
    permission_id_4 int;
    permission_id_5 int;
    permission_id_6 int;
    permission_id_7 int;
    permission_id_8 int;
    permission_id_9 int;
begin
    -- permissions
    permission_id_1 := permissions.permission_id_from_name('tenant.save');
    permission_id_2 := permissions.permission_id_from_name('tenant.list');
    permission_id_3 := permissions.permission_id_from_name('tenant.users.list');
    permission_id_4 := permissions.permission_id_from_name('tenant.roles.list');
    permission_id_5 := permissions.permission_id_from_name('files.upload');
    permission_id_6 := permissions.permission_id_from_name('tenant.fetch');
    permission_id_7 := permissions.permission_id_from_name('tenant.set.active');
    permission_id_8 := permissions.permission_id_from_name('tenant.roles.save');
    permission_id_9 := permissions.permission_id_from_name('tenant.role.assign.permission');

    user_id := public.gen_random_uuid();

    call users.user_save(
        user_id,
        'first',
        'middle',
        'last',
        'mr',
        'phd'
    );

    call users.users_set_active(
        user_id,
        true
    );

    call users.user_emails_add(
        user_id,
        'test_1@test.com'
    );

    call auth.user_auth_password_save(
        user_id,
        'test_1@test.com',
        'test12test'
    );

    call auth.user_auth_password_set_active(
        user_id,
        true
    );

    -- default tenant
    tenant_id_default := tenants.tenant_default_id();

    call tenants.tenant_user_save(
        tenant_id_default,
        user_id
    );

    role_id_default := public.gen_random_uuid();

    call tenants.role_save(
        tenant_id_default,
        role_id_default,
        'tenant_1_role',
        'tenant_1 role description'
    );

    call tenants.role_set_active(
        role_id_default,
        true
    );

    call tenants.role_users_add(
        array[role_id_default],
        array[user_id]
    );

    call tenants.tenant_user_set_active(
        tenant_id_default,
        user_id,
        true
    );

    call tenants.role_permissions_add(
        array[role_id_default],
        array[
        	permission_id_1,
         	permission_id_2,
          	permission_id_3,
          	permission_id_4,
          	permission_id_5,
          	permission_id_6,
          	permission_id_7,
           	permission_id_8,
            permission_id_9
        ]
    );

    call tenants.role_permission_set_active(
        role_id_default,
        array[
        	permission_id_1,
         	permission_id_2,
          	permission_id_3,
          	permission_id_4,
          	permission_id_5,
          	permission_id_6,
          	permission_id_7,
           	permission_id_8,
            permission_id_9
        ],
        true
    );

    -- tenant 1
    tenant_id_1 := public.gen_random_uuid();

    call tenants.tenant_save(
        tenant_id_1,
        'tenant_1',
        'tenant_1 description'
    );

    call tenants.tenant_set_active(
        tenant_id_1,
        true
    );

    call tenants.tenant_user_save(
        tenant_id_1,
        user_id
    );

    role_id_1 := public.gen_random_uuid();

    call tenants.role_save(
        tenant_id_1,
        role_id_1,
        'tenant_1_role',
        'tenant_1 role description'
    );

    call tenants.role_set_active(
        role_id_1,
        true
    );

    call tenants.role_users_add(
        array[role_id_1],
        array[user_id]
    );

    call tenants.tenant_user_set_active(
        tenant_id_1,
        user_id,
        true
    );

    call tenants.role_permissions_add(
        array[role_id_1],
        array[permission_id_1, permission_id_2, permission_id_3, permission_id_4, permission_id_5]
    );

    call tenants.role_permission_set_active(
        role_id_1,
        array[permission_id_1, permission_id_2, permission_id_3, permission_id_4, permission_id_5],
        true
    );


    -- tenant 2
    tenant_id_2 := public.gen_random_uuid();

    call tenants.tenant_save(
        tenant_id_2,
        'tenant_2',
        'tenant_2 description'
    );

    call tenants.tenant_set_active(
        tenant_id_2,
        true
    );

    call tenants.tenant_user_save(
        tenant_id_2,
        user_id
    );

    role_id_2 := public.gen_random_uuid();

    call tenants.role_save(
        tenant_id_2,
        role_id_2,
        'tenant_2_role',
        'tenant_2 role description'
    );
end
$$;

call create_test_accounts_1();
drop procedure create_test_accounts_1;
