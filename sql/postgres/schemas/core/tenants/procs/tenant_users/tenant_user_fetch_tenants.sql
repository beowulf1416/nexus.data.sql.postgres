create function tenant_user_fetch_tenants(
    p_user_id tenant_users.user_id%type
)
returns table (
    tenant_id tenants.tenant_id%type,
    active tenants.active%type,
    version tenants.version%type,
    created tenants.created_ts%type,
    updated tenants.updated_ts%type,
    name tenants.name%type,
    description tenants.description%type
)
language plpgsql
as $$
begin
    return query
    select
        distinct
        a.tenant_id,
        a.active,
        a.version,
        a.created_ts,
        a.updated_ts,
        a.name,
        a.description
    from tenants.tenants a
        join tenants.tenant_users b
            on a.tenant_id = b.tenant_id
    where
        b.user_id = p_user_id
    ;
end
$$;

comment on function tenant_user_fetch_tenants is 'fetch tenants assigned to user';
