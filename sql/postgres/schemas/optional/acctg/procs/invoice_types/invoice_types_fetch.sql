create or replace function invoice_types_fetch()
returns table (
    invoice_type_id invoice_types.invoice_type_id%type,
    name invoice_types.name%type
)
language plpgsql
as $$
begin
    return query
    select
        a.invoice_type_id,
        a.name
    from acctg.invoice_types a
    ;
end;
$$;

comment on function invoice_types_fetch is 'Fetches all invoice types from the acctg.invoice_types table.';
