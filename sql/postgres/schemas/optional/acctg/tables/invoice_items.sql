create table invoice_items (
	invoice_id uuid not null,
	invoice_item_id serial not null,

	description text not null,
	amount money not null,

	constraint fk_invoice_items_1
	foreign key (invoice_id)
	references acctg.invoices (invoice_id)
	on delete restrict
);

comment on table invoice_items is 'invoice line items';
