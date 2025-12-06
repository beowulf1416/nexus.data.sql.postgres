create procedure create_test_accounts_1()
language plpgsql
as $$
declare
    user_id uuid;
    tenant_id uuid;
    role_id uuid;
begin
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


    tenant_id := public.gen_random_uuid();

    call tenants.tenant_save(
        tenant_id,
        'tenant_1',
        'tenant_1 description'
    );

    call tenants.tenant_set_active(
        tenant_id,
        true
    );

    call tenants.tenant_user_save(
        tenant_id,
        user_id
    );

    role_id := public.gen_random_uuid();

    call tenants.role_save(
        tenant_id,
        role_id,
        'tenant_1_role',
        'tenant_1 role description'
    );


end
$$;

call create_test_accounts_1();
drop procedure create_test_accounts_1;