create or replace procedure invoice_save(
    p_tenant_id invoices.tenant_id%type,
    p_invoice_id invoices.invoice_id%type,
    p_invoice_type_id invoices.invoice_type_id%type,
    p_invoice_desc invoices.description%type,
    p_due_date invoices.due_date_ts%type
    -- p_currency_id invoices.currency_id%type
)
language plpgsql
as $$
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
    ;
end
$$;

comment on procedure invoice_save is 'Saves an invoice, inserting or updating as needed based on the invoice_id.';
