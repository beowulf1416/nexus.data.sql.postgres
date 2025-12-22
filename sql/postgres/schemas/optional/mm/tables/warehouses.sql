create table warehouses (
    tenant_id uuid not null,
    warehouse_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    name varchar(200) not null,
    description text,

    street text,
    city text,
    state text,
    zip_code varchar(100),
    country_id int not null
);


comment on table warehouses is 'warehouses';


alter table warehouses
add constraint pk_warehouses
primary key (warehouse_id)
;


alter table warehouses
add constraint u_warehouses_1
unique (tenant_id, warehouse_id)
;


alter table warehouses
add constraint fk_warehouses_1
foreign key (tenant_id)
references tenants.tenants (id)
on delete restrict
;


alter table warehouses
add constraint fk_warehouses_2
foreign key (country_id)
references common.countries (iso_3166_1_numeric)
on delete restrict
;