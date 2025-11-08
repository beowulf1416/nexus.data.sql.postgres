create table item_locations (
    item_id uuid not null,
    location_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc')
);


alter table item_locations
add constraint pk_item_locations
primary key (item_id, location_id)
;


alter table item_locations
add constraint fk_item_locations_1
foreign key (item_id)
references items (item_id)
on delete restrict
;


alter table item_locations
add constraint fk_item_locations_2
foreign key (location_id)
references locations (location_id)
on delete restrict
;