create or replace function warehouse_fetch_by_id(
    p_warehouse_id warehouses.warehouse_id%type
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
        a.warehouse_id = p_warehouse_id
    ;
end
$$;


comment on function warehouse_fetch_by_id is 'fetch warehouse for tenant with id';