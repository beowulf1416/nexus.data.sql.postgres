create or replace procedure item_set_active(
    p_item_id items.item_id%type,
    p_active items.active%type
)
language plpgsql
as $$
begin
    update mm.items set
        active = p_active
    where
        item_id = p_item_id
    ;
end
$$;


comment on procedure item_set_active is 'set inventory item active status';