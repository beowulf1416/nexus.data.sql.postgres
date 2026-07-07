create or replace procedure invoice_items_save(
    p_invoice_id invoice_items.invoice_id%type,
    p_items invoice_item_type[]
)
language plpgsql
as $$
begin
    merge into acctg.invoice_items t
    using (
        select
            p_invoice_id invoice_id,
            a.invoice_item_id,
            a.description,
            a.quantity,
            a.unit_price,
            a.currency_id
        from unnest(p_items) a
    ) s
    on t.invoice_id = s.invoice_id
        and t.invoice_item_id = s.invoice_item_id
    when matched then update
    set
        quantity = s.quantity,
        unit_price = s.unit_price,
        currency_id = s.currency_id
    when not matched by target then insert (
        invoice_id,
        invoice_item_id,
        description,
        quantity,
        unit_price,
        currency_id
    ) values (
        s.invoice_id,
        s.invoice_item_id,
        s.description,
        s.quantity,
        s.unit_price,
        s.currency_id
    )
    when not matched by source then delete
    ;
end;
$$;

comment on procedure invoice_items_save is 'Saves invoice items for a given invoice, updating existing items or inserting new ones.';
