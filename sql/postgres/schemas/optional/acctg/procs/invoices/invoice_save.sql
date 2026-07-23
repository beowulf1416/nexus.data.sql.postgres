create or replace procedure invoice_save(
    p_tenant_id invoices.tenant_id%type,
    p_invoice_id invoices.invoice_id%type,
    p_invoice_type_id invoices.invoice_type_id%type,
    p_invoice_desc invoices.description%type,
    p_due_date invoices.due_date_ts%type,
    p_items acctg.invoice_item_type[],
    p_version invoices.version%type
)
language plpgsql
as $$
declare
    v_rows_affected int;
begin
    insert into acctg.invoices (
        tenant_id,
        active,
        invoice_id,
        invoice_type_id,
        description,
        due_date_ts
        -- currency_id
    )
    values (
        p_tenant_id,
        true,
        p_invoice_id,
        p_invoice_type_id,
        p_invoice_desc,
        p_due_date
        -- p_currency_id
    )
    on conflict (invoice_id)
    do update set
        invoice_type_id = p_invoice_type_id,
        description = p_invoice_desc,
        due_date_ts = p_due_date
        -- currency_id = p_currency_id
        version = acctg.invoices.version + 1
    where
        version = p_version
    ;

    get diagnostics v_rows_affected = ROW_COUNT;
    if v_rows_affected <> 1 then
        raise exception 'data has been modified';
    end if;

    delete from acctg.invoice_items
    where
        invoice_id = p_invoice_id
    ;

    insert into acctg.invoice_items (
        invoice_id,
        invoice_item_id,
        description,
        quantity,
        unit_price,
        currency_id
    )
    select
        p_invoice_id,
        a.invoice_item_id,
        a.description,
        a.quantity,
        a.unit_price,
        a.currency_id
    from unnest(p_items) a
    ;
end
$$;

comment on procedure invoice_save is 'Saves an invoice, inserting or updating as needed based on the invoice_id.';
