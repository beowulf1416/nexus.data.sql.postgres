create or replace function location_save(
    p_tenant_id locations.tenant_id%type,
    p_filter varchar(100)
)
returns table (
    location_id locations.location_id%type,
    active locations.active%type,
    name locations.name%type,
    description locations.description%type
)
language plpgsql
as $$
begin
    return query
    select
        a.location_id,
        a.active,
        a.name,
        a.description
    from mm.locations a
    where
        a.tenant_id = p_tenant_id
        and concat(a.name, a.description) like p_filter
    ;
end
$$;


comment on function location_save is 'fetch locations for tenant with optional filter on name and description';