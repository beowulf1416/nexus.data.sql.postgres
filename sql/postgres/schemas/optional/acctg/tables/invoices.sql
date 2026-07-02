create table invoices (
    invoice_id uuid not null,
    tenant_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default( now() at time zone 'utc'),

    invoice_date timestamp with time zone default(now() at time zone 'utc'),
    due_date timestamp with time zone default(now() at time zone 'utc'),
    description text,
    billing_account_id uuid not null,
    currency int not null,

    constraint pk_invoices
    primary key (invoice_id)
);
