create or replace function tenants_fetch(
    p_filter varchar(100)
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
        concat(a.name, a.description) ilike p_filter
    ;
end
$$;


comment on function tenants_fetch is 'fetch tenant records';
