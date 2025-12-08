set search_path to permissions, public;

create procedure create_test_accounts_1()
language plpgsql
as $$
declare
    user_id uuid;
    tenant_id_1 uuid;
    tenant_id_2 uuid;
    role_id_1 uuid;
    role_id_2 uuid;
    permission_id_1 int;
    permission_id_2 int;
begin
    -- permissions
    permission_id_1 := permissions.permission_id_from_name('tenant.save');
    permission_id_2 := permissions.permission_id_from_name('tenant.list');
    
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

    call tenants.role_users_add(
        array[role_id_1],
        array[user_id]
    );

    call tenants.role_permissions_add(
        array[role_id_1],
        array[permission_id_1, permission_id_2]
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