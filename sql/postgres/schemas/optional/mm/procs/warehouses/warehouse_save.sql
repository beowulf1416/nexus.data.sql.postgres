create or replace procedure warehouse_save(
    p_tenant_id warehouses.tenant_id%type,
    p_warehouse_id warehouses.warehouse_id%type,
    p_name warehouses.name%type,
    p_description warehouses.description%type
)
language plpgsql
as $$
begin
    insert into mm.warehouses (
        tenant_id,
        warehouse_id,
        active,
        name,
        description
    ) values (
        p_tenant_id,
        p_warehouse_id,
        true,
        p_name,
        p_description
    ) on conflict (warehouse_id) do
    update set
        name = p_name,
        description = p_description
    ;
end
$$;


comment on procedure warehouse_save is 'save warehouse record';