create table locations (
    tenant_id uuid not null,
    location_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    name varchar(200) not null,
    description text
);


comment on table locations is 'locations';


alter table locations
add constraint pk_locations
primary key (location_id)
;


alter table locations
add constraint u_locations_1
unique (tenant_id, location_id)
;


alter table locations
add constraint fk_locations_1
foreign key (tenant_id)
references tenants.tenants (id)
on delete restrict
;