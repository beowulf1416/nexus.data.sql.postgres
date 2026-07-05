create or replace procedure invoice_item_save(
    p_invoice_id invoice_items.invoice_id%type,
    p_item_id invoice_items.invoice_item_id%type,
    p_description invoice_items.description%type,
    p_qty invoice_items.quantity%type,
    p_uom_id invoice_items.uom_id%type,
    p_unit_price invoice_items.unit_price%type,
    p_currency_id invoice_items.currency_id%type
)
language plpgsql
as $$
begin
    insert into acctg.invoice_items (
        invoice_id,
        invoice_item_id,
        active,
        description,
        quantity,
        uom_id,
        unit_price,
        currency_id
    ) values (
        p_invoice_id,
        p_item_id,
        true,
        p_description,
        p_qty,
        p_uom_id,
        p_unit_price,
        p_currency_id
    )
    on conflict (invoice_id, invoice_item_id)
    do update set
        description = p_description,
        quantity = p_qty,
        uom_id = p_uom_id,
        unit_price = p_unit_price,
        currency_id = p_currency_id,
        updated_ts = now() at time zone 'utc'
    ;
end
$$;

comment on procedure invoice_item_save is 'save or update an invoice item record';
