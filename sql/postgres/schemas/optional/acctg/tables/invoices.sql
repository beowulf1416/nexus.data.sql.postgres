create table invoices (
    invoice_id uuid not null,
    tenant_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default( now() at time zone 'utc'),

    invoice_type_id int not null,
    invoice_id_seq int not null default nextval('acctg.seq_invoice_id'),

    due_date_ts timestamp with time zone,
    description text,
    -- billing_account_id uuid not null,
    currency_id int not null,

    constraint pk_invoices
    primary key (invoice_id),

    constraint fk_invoices_1
    foreign key (tenant_id)
    references tenants.tenants (tenant_id)
    on delete restrict,

    constraint fk_invoices_2
    foreign key (invoice_type_id)
    references invoice_types (invoice_type_id)
    on delete restrict,

    constraint fk_invoices_3
    foreign key (currency_id)
    references common.currencies (currency_id)
    on delete restrict
);

comment on table invoices is 'invoice details';
comment on column invoices.created_ts is 'invoice creation timestamp, doubles as the invoice date';
