create or replace function tenants_fetch_by_id(
    p_tenant_id tenants.tenant_id%type
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
        a.tenant_id,
        a.active,
        a.version,
        a.created_ts,
        a.updated_ts,
        a.name,
        a.description
    from tenants.tenants a
    where
        a.tenant_id = p_tenant_id
    ;
end
$$;

comment on function tenants_fetch_by_id is 'fetch tenant record';
