create procedure add_accounts()
language plpgsql
as $$
declare
    v_tenant_01_id uuid;
    v_acct_asset_id uuid;
    v_acct_cash_on_hand_id uuid;
    v_acct_coh_pf1_id uuid;
    v_acct_coh_pf2_id uuid;
begin
    select
		tenant_id into v_tenant_01_id
	from tenants.tenant_fetch_by_name('tenant_01')
	;

	select
		account_id into v_acct_asset_id
	from acctg.account_fetch_by_name(v_tenant_01_id, 'asset')
	;

	v_acct_cash_on_hand_id := public.gen_random_uuid();

	call acctg.account_save(
	    v_tenant_01_id,
		v_acct_cash_on_hand_id,
		1::smallint,
		1::smallint,
		'1',
		'cash on hand',
		'cash on hand'
	);

	call acctg.account_hierarchy_save(
	    v_tenant_01_id,
	    v_acct_cash_on_hand_id,
		v_acct_asset_id
	);

	v_acct_coh_pf1_id := public.gen_random_uuid();

	call acctg.account_save(
	    v_tenant_01_id,
		v_acct_coh_pf1_id,
		1::smallint,
		1::smallint,
		'1',
		'petty cash 01',
		'petty cash 01'
	);

	call acctg.account_hierarchy_save(
	    v_tenant_01_id,
	    v_acct_coh_pf1_id,
		v_acct_cash_on_hand_id
	);

	v_acct_coh_pf2_id := public.gen_random_uuid();

	call acctg.account_save(
	    v_tenant_01_id,
		v_acct_coh_pf2_id,
		1::smallint,
		1::smallint,
		'1',
		'petty cash 02',
		'petty cash 02'
	);

	call acctg.account_hierarchy_save(
	    v_tenant_01_id,
	    v_acct_coh_pf2_id,
		v_acct_cash_on_hand_id
	);
end;
$$;

call add_accounts();
drop procedure add_accounts;
