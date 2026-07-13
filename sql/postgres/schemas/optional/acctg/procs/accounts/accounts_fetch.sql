create or replace function accounts_fetch(
    p_tenant_id uuid,
    p_account_type_id accounts.account_type_id%type default null,
    p_filter text default '%'
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
        and (
            p_account_type_id is not null
            and a.account_type_id = p_account_type_id
            )
        and a.name ilike p_filter
    ;
end;
$$;

comment on function accounts_fetch is 'Fetches accounts based on tenant and filter criteria.';
