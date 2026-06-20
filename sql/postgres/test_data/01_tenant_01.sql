create procedure create_tenant_01()
language plpgsql
as $$
declare
    tenant_id uuid;
    role_01 uuid;
begin
	tenant_id := public.gen_random_uuid();

	call tenants.tenant_save(
		tenant_id,
		'tenant_01',
		'tenant_01'
	);

	-- create role_01
	role_01 := public.gen_random_uuid();
	call tenants.role_save(
        tenant_id,
        role_01,
        'tenant_01_role',
        'tenant_01 role description'
    );

    call tenants.role_set_active(
        role_01,
        true
    );

end;
$$;

call create_tenant_01();
drop procedure create_tenant_01;
