create or replace function tenants_fetch_by_id(
    p_tenant_id tenants.id%type
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
        a.id,
        a.active,
        a.created_ts,
        a.name,
        a.description
    from tenants.tenants a
    where
        a.id = p_tenant_id
    ;
end
$$;

comment on function tenants_fetch_by_id is 'fetch tenant record';
