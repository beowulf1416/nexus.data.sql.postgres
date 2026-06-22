create procedure create_role_01()
language plpgsql
as $$
declare
	v_role_id uuid;
	v_tenant_id uuid;
	v_role_ids uuid[];
	v_permission_ids int[];
begin
	v_role_id := public.gen_random_uuid();

	select
		tenant_id into v_tenant_id
	from tenants.tenant_fetch_by_name('tenant_01')
	;

	-- create role
	call tenants.role_save(
		v_tenant_id,
		v_role_id,
		'tenant_01_role_01',
		'tenant_01_role_01'
	);

	call tenants.role_set_active(
		v_role_id,
		true
	);

	-- assign permissions to role
	v_role_ids := array_append(v_role_ids, v_role_id);

	select
		array_agg(a.id) into v_permission_ids
	from permissions.permissions a
	;

	call tenants.role_permissions_add(
		v_role_ids,
		v_permission_ids
	);

	update tenants.role_permissions set
		active = true
	where
		role_id = v_role_id
	;
end;
$$;

call create_role_01();
drop procedure create_role_01;
