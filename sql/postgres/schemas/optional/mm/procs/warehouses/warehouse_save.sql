create or replace procedure warehouse_save(
    p_tenant_id warehouses.tenant_id%type,
    p_warehouse_id warehouses.warehouse_id%type,
    p_name warehouses.name%type,
    p_description warehouses.description%type,
    p_city warehouses.city%type,
    p_state warehouses.state%type,
    p_street warehouses.street%type,
    p_zip_code warehouses.zip_code%type,
    p_country_id warehouses.country_id%type
)
language plpgsql
as $$
begin
    insert into mm.warehouses (
        tenant_id,
        warehouse_id,
        active,
        name,
        description,

        city,
        state,
        street,
        zip_code,
        country_id
    ) values (
        p_tenant_id,
        p_warehouse_id,
        true,
        p_name,
        p_description,

        p_city,
        p_state,
        p_street,
        p_zip_code,
        p_country_id
    ) on conflict (warehouse_id) do
    update set
        name = p_name,
        description = p_description
    ;
end
$$;


comment on procedure warehouse_save is 'save warehouse record';