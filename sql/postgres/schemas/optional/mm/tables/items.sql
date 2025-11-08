create table items (
    tenant_id uuid not null,
    item_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default( now() at time zone 'utc'),
    name varchar(200) not null,
    description text,
    sku varchar(100),
    upc varchar(100)
);


comment on table items is 'items';


alter table items
add constraint pk_items
primary key (item_id)
;


alter table items
add constraint u_items_1
unique (tenant_id, item_id)
;


alter table items
add constraint u_items_2
unique (tenant_id, name)
;


alter table items
add constraint fk_items_1
foreign key (tenant_id)
references tenants.tenants (id)
on delete restrict
;