set search_path to tenants, acctg, public;

create procedure create_tenant_01()
language plpgsql
as $$
declare
    v_tenant_id uuid;
    v_tenant_version int;
    v_role_01 uuid;
begin
	v_tenant_id := public.gen_random_uuid();
	v_tenant_version := 0;

	call tenants.tenant_save(
		v_tenant_id,
		'tenant_01',
		'tenant_01',
		v_tenant_version
	);

	select
	    version into v_tenant_version
	from tenants.tenants_fetch_by_id(v_tenant_id)
	;

	call tenants.tenant_save(
		v_tenant_id,
		'tenant_01',
		'tenant_01 updated',
		v_tenant_version
	);

	call tenants.tenant_set_active(
		v_tenant_id,
		true
	);

	-- create role_01
	v_role_01 := public.gen_random_uuid();
	call tenants.role_save(
        v_tenant_id,
        v_role_01,
        'tenant_01_role',
        'tenant_01 role description'
    );

    call tenants.role_set_active(
        v_role_01,
        true
    );

end;
$$;

call create_tenant_01();
drop procedure create_tenant_01;
