create procedure create_user_01()
language plpgsql
as $$
declare
	v_user_id uuid;
    v_tenant_id uuid;
begin
	v_user_id := public.gen_random_uuid();

	select
		tenant_id into v_tenant_id
	from tenants.tenant_fetch_by_name('tenant_01')
	;

	call users.user_save(
        v_user_id,
        'user_01',
        'user_01',
        'user_01',
        'mr',
        'phd'
    );

    call users.users_set_active(
        v_user_id,
        true
    );

    call users.user_emails_add(
        v_user_id,
        'user_01@test.com'
    );

    call auth.user_auth_password_save(
        v_user_id,
        'user_01@test.com',
        'test12test'
    );

    call auth.user_auth_password_set_active(
        v_user_id,
        true
    );

    -- add to tenant_01 tenant
    call tenants.tenant_user_save(
        v_tenant_id,
        v_user_id
    );

end;
$$;

call create_user_01();
drop procedure create_user_01;
