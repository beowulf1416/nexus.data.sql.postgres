create or replace procedure item_save(
    p_tenant_id items.tenant_id%type,
    p_item_id items.item_id%type,
    p_name items.name%type,
    p_description items.description%type,
    p_sku items.sku%type,
    p_upc items.upc%type
)
language plpgsql
as $$
begin
    insert into mm.items (
        tenant_id,
        item_id,
        active,
        name,
        description,
        sku,
        upc
    ) values (
        p_tenant_id,
        p_item_id,
        true,
        p_name,
        p_description,
        p_sku,
        p_upc
    ) on conflict (item_id) do
    update set
        name = p_name,
        description = p_description,
        sku = p_sku,
        upc = p_upc
    ;
end
$$;


comment on procedure item_save is 'save inventory item record';