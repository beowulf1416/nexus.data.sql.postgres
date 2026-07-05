create or replace procedure add_crm_partners()
language plpgsql
as $$
declare
    v_tenant_id uuid;
    v_partner_id_1 uuid;
    v_partner_id_2 uuid;
    v_partner_ids uuid[];
begin
    v_partner_id_1 := public.gen_random_uuid();
    v_partner_id_2 := public.gen_random_uuid();

    select
		tenant_id into v_tenant_id
	from tenants.tenant_fetch_by_name('tenant_01')
	;

	call crm.partner_save(
		v_tenant_id,
		v_partner_id_1,
		'partner_01',
		'partner_01',
		'partner_01',
		'partner_01',
		'partner_01',
		'mr',
		'phd'
	);

	call crm.partner_save(
		v_tenant_id,
		v_partner_id_2,
		'partner_02',
		'partner_02',
		'partner_02',
		'partner_02',
		'partner_02',
		'mr',
		'phd'
	);

	v_partner_ids := array_append(v_partner_ids, v_partner_id_1);
	v_partner_ids := array_append(v_partner_ids, v_partner_id_2);

	call crm.partners_set_active(
		v_partner_ids,
		true
	);
end;
$$;

call add_crm_partners();
drop procedure add_crm_partners();
