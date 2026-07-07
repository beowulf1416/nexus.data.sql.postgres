create type invoice_item_type as (
    invoice_item_id uuid,
    description text,
    quantity decimal(12,4),
    unit_price common.nmoney,
    currency_id int
);
