create or replace procedure tenant_save(
    p_tenant_id tenants.tenant_id%type,
    p_name tenants.name%type,
    p_description tenants.description%type
)
language plpgsql
as $$
begin
    insert into tenants.tenants (
        tenant_id,
        name,
        description
    ) values (
        p_tenant_id,
        p_name,
        p_description
    )
    on conflict (tenant_id) do
    update set
        name = p_name,
        description = p_description
    ;

    -- insert this tenant's root account
    insert into acctg.accounts (
        account_id,
        tenant_id,
        account_type_id,
        account_category_id,
        name,
        description,
        code
    ) values (
        p_tenant_id,
        p_tenant_id,
        0,
        0,
        concat('root-', p_name),
        concat('root-', p_name),
        '0'
    )
    on conflict (account_id) do nothing
    ;
end
$$;

comment on procedure tenant_save is 'save tenant record';
