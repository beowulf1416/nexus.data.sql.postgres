create or replace function item_fetch_by_id(
    p_item_id items.item_id%type
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
        a.item_id = p_item_id
    ;
end
$$;