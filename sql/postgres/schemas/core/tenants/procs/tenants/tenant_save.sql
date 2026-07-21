create or replace procedure tenant_save(
    p_tenant_id tenants.tenants.tenant_id%type,
    p_name tenants.tenants.name%type,
    p_description tenants.tenants.description%type,
    p_version tenants.tenants.version%type
)
language plpgsql
as $$
declare
    v_version tenants.tenants.version%type;
    acctg_asset_id acctg.accounts.account_id%type;
    acctg_liability_id acctg.accounts.account_id%type;
    acctg_equity_id acctg.accounts.account_id%type;
    acctg_expense_id acctg.accounts.account_id%type;
    acctg_income_id acctg.accounts.account_id%type;
    v_rows_affected int;
begin
    insert into tenants.tenants (
        tenant_id,
        name,
        description
    ) values (
        p_tenant_id,
        lower(p_name),
        p_description
    )
    on conflict (tenant_id) do
    update set
        name = lower(p_name),
        description = p_description,
        updated_ts = now() at time zone 'utc',
        version = tenants.tenants.version + 1
    where
        tenants.tenants.version = p_version
    ;

    get diagnostics v_rows_affected = ROW_COUNT;
    if v_rows_affected <> 1 then
        raise exception 'data has been modified by another session';
    end if;

    select
        version into v_version
    from tenants.tenants a
    where
        tenant_id = p_tenant_id
    ;

    if v_version = 0 then
        -- insert this tenant skeleton accounting accounts
        acctg_asset_id := public.gen_random_uuid();
        acctg_liability_id := public.gen_random_uuid();
        acctg_equity_id := public.gen_random_uuid();
        acctg_expense_id := public.gen_random_uuid();
        acctg_income_id := public.gen_random_uuid();

        insert into acctg.accounts (
            account_id,
            tenant_id,
            account_type_id,
            account_category_id,
            name,
            description,
            code
        )
        select
            a.account_id,
            p_tenant_id,
            a.account_type_id,
            a.account_category_id,
            a.name,
            a.description,
            ''
        from unnest(array[
            (acctg_asset_id, 1::smallint, 1::smallint, lower('Asset')::text, 'Asset'::text),
            (acctg_liability_id, 2::smallint, 1::smallint, lower('Liability')::text, 'Liability'::text),
            (acctg_equity_id, 3::smallint, 1::smallint, lower('Equity')::text, 'Equity'::text),
            (acctg_expense_id, 4::smallint, 1::smallint, lower('Expense')::text, 'Expense'::text),
            (acctg_income_id, 5::smallint, 1::smallint, lower('Income')::text, 'Income'::text)
        ]) as a (
            account_id uuid,
            account_type_id smallint,
            account_category_id smallint,
            name varchar(100),
            description varchar(300)
        )
        on conflict (tenant_id, name)
        do nothing
        ;

        -- insert root organization
        insert into organizations.organizations (
            tenant_id,
            org_id,
            active,
            name,
            description
        )
        values (
            p_tenant_id,
            p_tenant_id,
            true,
            'root',
            'root organization'
        )
        on conflict (tenant_id, org_id)
        do nothing
        ;
    end if;
end
$$;

comment on procedure tenant_save is 'save tenant record';
