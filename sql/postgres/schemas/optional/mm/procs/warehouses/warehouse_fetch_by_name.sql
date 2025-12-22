create or replace function warehouse_fetch_by_name(
    p_tenant_id warehouses.tenant_id%type,
    p_name warehouses.name%type
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
        and a.name = p_name
    ;
end
$$;


comment on function warehouse_fetch_by_name is 'fetch warehouse for tenant with name';