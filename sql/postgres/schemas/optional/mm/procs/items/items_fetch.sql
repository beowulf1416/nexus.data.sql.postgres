create or replace function items_fetch(
    p_tenant_id items.tenant_id%type,
    p_filter varchar(100)
)
returns table (
    item_id items.item_id%type,
    active items.active%type,
    created items.created_ts%type,
    name items.name%type,
    description items.description%type,
    sku items.sku%type,
    upc items.upc%type
)
language plpgsql
as $$
begin
    return query
    select
        a.item_id,
        a.active,
        a.created_ts,
        a.name,
        a.description,
        a.sku,
        a.upc
    from mm.items a
    where
        a.tenant_id = p_tenant_id
        and concat(a.name, a.description, a.sku, a.upc) like p_filter
    ;
end
$$;


comment on function items_fetch is 'fetch inventory items with filter';