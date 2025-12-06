create function tenant_user_fetch_tenants(
    p_user_id tenant_users.user_id%type
)
returns table (
    tenant_id tenants.id%type,
    active tenants.active%type,
    created tenants.created_ts%type,
    name tenants.name%type,
    description tenants.description%type
)
language plpgsql
as $$
begin
    return query
    select
        distinct
        a.id,
        a.active,
        a.created_ts,
        a.name,
        a.description
    from tenants.tenants a
        join tenants.tenant_users b
            on a.id = b.tenant_id
    where
        b.user_id = p_user_id
    ;
end
$$;

comment on function tenant_user_fetch_tenants is 'fetch tenants assigned to user';