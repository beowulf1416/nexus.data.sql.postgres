create or replace function warehouse_fetch(
    p_tenant_id warehouses.tenant_id%type,
    p_filter varchar(100)
)
returns table (
    warehouse_id warehouses.warehouse_id%type,
    active warehouses.active%type,
    name warehouses.name%type,
    description warehouses.description%type
)
language plpgsql
as $$
begin
    return query
    select
        a.warehouse_id,
        a.active,
        a.name,
        a.description
    from mm.warehouses a
    where
        a.tenant_id = p_tenant_id
        and concat(a.name, a.description) like p_filter
    ;
end
$$;


comment on function warehouse_fetch is 'fetch warehouses for tenant with optional filter on name and description';