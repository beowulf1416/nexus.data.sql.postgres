create table invoice_items (
	invoice_id uuid not null,
	invoice_item_id uuid not null,
	active bool not null default true,
	version int not null default 0,
    created_ts timestamp with time zone not null default( now() at time zone 'utc'),
    updated_ts timestamp with time zone not null default( now() at time zone 'utc'),

	description text not null,
	quantity decimal(12,4) not null,
	-- uom_id int not null,
	unit_price common.nmoney not null,
	total common.nmoney not null generated always as (quantity * unit_price) stored,
	currency_id int not null,

	constraint pk_invoice_items
	primary key (invoice_item_id),

	constraint u_invoice_items_1
	unique (invoice_id, invoice_item_id),

	constraint fk_invoice_items_1
	foreign key (invoice_id)
	references acctg.invoices (invoice_id)
	on delete restrict,

	-- constraint fk_invoice_items_2
	-- foreign key (uom_id)
 --    references common.uom (uom_id),

    constraint chk_invoice_items_1
    check (
        quantity > 0
        and unit_price > 0
    )
);

comment on table invoice_items is 'invoice line items';
