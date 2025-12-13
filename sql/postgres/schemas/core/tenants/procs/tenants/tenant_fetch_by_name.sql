create or replace function tenant_fetch_by_name(
    p_name tenants.name%type
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
        a.name = p_name
    ;
end
$$;

comment on function tenant_fetch_by_name is 'fetch tenant record by name';
