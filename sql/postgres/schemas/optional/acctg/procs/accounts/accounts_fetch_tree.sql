create or replace function accounts_fetch_tree(
    p_tenant_id accounts.tenant_id%type
)
returns table (
    account_id accounts.account_id%type,
    name accounts.name%type,
    level int,
    path text
)
language plpgsql
as $$
begin
    return query
    with recursive accounts_tree as (
        -- root accounts
        select
            a.account_id,
            a.name,
            0 as level,
            a.name::text as path
        from acctg.accounts a
            left join acctg.account_hierarchy b
                on a.account_id = b.account_id
        where
            a.tenant_id = p_tenant_id
            and b.tenant_id is null
            and b.parent_account_id is null

        union all
        -- child accounts
        select
            c.account_id,
            c.name,
            e.level + 1 as level,
            e.path || '.' || c.name as path
        from acctg.accounts c
            join acctg.account_hierarchy d
                on c.account_id = d.account_id
            join accounts_tree e
                on e.account_id = d.parent_account_id
        where
            c.tenant_id = p_tenant_id
            and d.tenant_id = p_tenant_id
    )
    select
        aa.account_id,
        aa.name,
        aa.level,
        aa.path
    from accounts_tree aa
    order by
        aa.path
    ;
end;
$$;

comment on function accounts_fetch_tree is 'Fetches the account hierarchy for a given tenant as a recursive tree structure.';
