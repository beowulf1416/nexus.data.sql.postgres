create table invoice_items (
	invoice_id uuid not null,
	invoice_item_id serial not null,

	description text not null,
	quantity decimal(12,4) not null,
	uom_id int not null,
	unit_price money not null,
	total money not null generated always as (quantity * unit_price) stored,
	currency_id int not null,

	constraint fk_invoice_items_1
	foreign key (invoice_id)
	references acctg.invoices (invoice_id)
	on delete restrict,

	constraint fk_invoice_items_2
	foreign key (uom_id)
    references common.uom (uom_id)
);

comment on table invoice_items is 'invoice line items';
