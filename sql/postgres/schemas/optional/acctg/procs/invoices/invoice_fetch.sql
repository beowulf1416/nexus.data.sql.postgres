create or replace function invoice_fetch(
    p_invoice_id invoices.invoice_id%type
)
returns table (
    invoice_id invoices.invoice_id%type,
    active invoices.active%type,
    created_ts invoices.created_ts%type,
    updated_ts invoices.updated_ts%type,
    invoice_type_id invoices.invoice_type_id%type,
    invoice_id_seq invoices.invoice_id_seq%type,
    due_date_ts invoices.due_date_ts%type,
    description text
)
language plpgsql
as $$
begin
    return query
    select
        a.invoice_id,
        a.active,
        a.created_ts,
        a.updated_ts,
        a.invoice_type_id,
        a.invoice_id_seq,
        a.due_date_ts,
        a.description
    from acctg.invoices a
    where
        a.invoice_id = p_invoice_id
    ;
end;
$$;
