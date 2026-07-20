create or replace function organizations_fetch_all(
    p_tenant_id organizations.tenant_id%type
)
returns table (
    org_id organizations.org_id%type,
    active organizations.active%type,
    created organizations.created_ts%type,
    name organizations.name%type,
    description organizations.description%type,
    parent_org_id organizations.org_id%type,
    level int,
    path text
)
language plpgsql
as $$
begin
    return query
    with recursive tree as (
        --root account
        select
            a.org_id,
            a.active,
            a.created_ts,
            a.name,
            a.description,
            b.parent_org_id,
            0 level,
            a.name::text path
        from organizations.organizations a
            left join organizations.org_tree b
                on a.org_id = b.org_id
        where
            a.tenant_id = p_tenant_id
            and b.tenant_id is null

        union all
        -- child accounts
        select
            c.org_id,
            c.active,
            c.created_ts,
            c.name,
            c.description,
            d.parent_org_id,
            e.level + 1 level,
            e.path || '.' || c.name::text path
        from organizations.organizations c
            join organizations.org_tree d
                on c.org_id = d.org_id
            join tree e
                on e.org_id = d.parent_org_id
        where
            c.tenant_id = p_tenant_id
            and d.tenant_id = p_tenant_id
    )
    select
        aa.org_id,
        aa.active,
        aa.created_ts,
        aa.name,
        aa.description,
        aa.parent_org_id,
        aa.level,
        aa.path
    from tree aa
    order by
        aa.path
    ;
end
$$;

comment on function organizations_fetch_all is 'fetch all organizations for this tenant';
