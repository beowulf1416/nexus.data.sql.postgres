create or replace procedure warehouse_set_active(
    p_warehouse_id warehouses.warehouse_id%type,
    p_active warehouses.active%type 
)
language plpgsql
as $$
begin
    update mm.warehouses set
        active = p_active
    where 
        warehouse_id = p_warehouse_id
    ;
end
$$;


comment on procedure warehouse_set_active is 'set warehouse active status';