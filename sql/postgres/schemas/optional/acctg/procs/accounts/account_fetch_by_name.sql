create or replace function account_fetch_by_name(
    p_tenant_id accounts.tenant_id%type,
    p_name accounts.name%type
)
returns table(
    account_id accounts.account_id%type,
    active accounts.active%type,
    account_type_id accounts.account_type_id%type,
    account_category_id accounts.account_category_id%type,
    name accounts.name%type,
    code accounts.code%type,
    description accounts.description%type
)
language plpgsql
as $$
begin
    return query
    select
        a.account_id,
        a.active,
        a.account_type_id,
        a.account_category_id,
        a.name,
        a.code,
        a.description
    from acctg.accounts a
    where
        a.tenant_id = p_tenant_id
        and a.name = lower(p_name)
    ;
end;
$$;

comment on function account_fetch_by_name is 'Fetches accounts by name for a given tenant';
