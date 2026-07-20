create or replace procedure tenant_01_add_organizations()
language plpgsql
as $$
declare
    v_tenant_01_id uuid;
    v_child_01_id uuid;
    v_child_01_01_id uuid;
    v_child_02_id uuid;
begin
    select
		tenant_id into v_tenant_01_id
	from tenants.tenant_fetch_by_name('tenant_01')
	;

	-- add organization, child of root organization
	v_child_01_id := public.gen_random_uuid();
	v_child_01_01_id := public.gen_random_uuid();

	v_child_02_id := public.gen_random_uuid();

	call organizations.organization_save(
	    v_tenant_01_id,
		v_child_01_id,
		'child_01',
		'child_01',
		v_tenant_01_id
	);

	call organizations.organization_save(
	    v_tenant_01_id,
		v_child_02_id,
		'child_02',
		'child_02',
		v_tenant_01_id
	);



	call organizations.organization_save(
	    v_tenant_01_id,
		v_child_01_01_id,
		'child_01_01',
		'child_01_01',
		v_child_01_id
	);
end

$$;

call tenant_01_add_organizations();
drop procedure tenant_01_add_organizations();
