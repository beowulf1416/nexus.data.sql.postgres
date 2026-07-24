create or replace procedure invoice_save(
    p_tenant_id invoices.tenant_id%type,
    p_invoice_id invoices.invoice_id%type,
    p_invoice_type_id invoices.invoice_type_id%type,
    p_account_id invoices.account_id%type,
    p_org_id invoices.org_id%type,
    p_partner_id invoices.partner_id%type,
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
        account_id,
        org_id,
        partner_id,
        description,
        due_date_ts
    )
    values (
        p_tenant_id,
        true,
        p_invoice_id,
        p_invoice_type_id,
        p_account_id,
        p_org_id,
        p_partner_id,
        p_invoice_desc,
        p_due_date
        -- p_currency_id
    )
    on conflict (invoice_id)
    do update set
        invoice_type_id = p_invoice_type_id,
        account_id = p_account_id,
        org_id = p_org_id,
        partner_id = p_partner_id,
        description = p_invoice_desc,
        due_date_ts = p_due_date,
        version = acctg.invoices.version + 1,
        updated_ts = now() at time zone 'utc'
    where
        acctg.invoices.version = p_version
    ;

    get diagnostics v_rows_affected = ROW_COUNT;
    if v_rows_affected <> 1 then
        raise exception 'data has been modified';
    end if;

    -- delete from acctg.invoice_items
    -- where
    --     invoice_id = p_invoice_id
    -- ;

    -- insert into acctg.invoice_items (
    --     invoice_id,
    --     invoice_item_id,
    --     description,
    --     quantity,
    --     unit_price,
    --     currency_id
    -- )
    -- select
    --     p_invoice_id,
    --     a.invoice_item_id,
    --     a.description,
    --     a.quantity,
    --     a.unit_price,
    --     a.currency_id
    -- from unnest(p_items) a
    -- ;

    merge into acctg.invoice_items dest
    using (
        select
            a.*
        from unnest(p_items) a
    ) src
    on dest.invoice_id = p_invoice_id
        and dest.invoice_item_id = src.invoice_item_id
    when matched and dest.version = src.version then
        update set
            description = src.description,
            quantity = src.quantity,
            unit_price = src.unit_price,
            -- total = src.quantity * src.unit_price,
            currency_id = src.currency_id,
            version = dest.version + 1,
            updated_ts = now() at time zone 'utc'
    when not matched by target then
        insert (
            invoice_id,
            invoice_item_id,
            description,
            quantity,
            unit_price,
            -- total,
            currency_id
        ) values (
            p_invoice_id,
            src.invoice_item_id,
            src.description,
            src.quantity,
            src.unit_price,
            -- src.quantity * src.unit_price,
            src.currency_id
        )
    when not matched by source then
        delete
    ;
end
$$;

comment on procedure invoice_save is 'Saves an invoice, inserting or updating as needed based on the invoice_id.';
