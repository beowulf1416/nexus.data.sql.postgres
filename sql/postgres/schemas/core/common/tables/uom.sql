create table uom (
    id bigint not null,
    dimension_id int not null,
    name varchar(100) not null,
    symbol varchar(10)
);


comment on table uom is 'units of measure';


alter table uom
add constraint pk_uom
primary key (id)
;


alter table uom
add constraint u_uom_1
unique (dimension_id, name, symbol)
;


alter table uom
add constraint fk_uom_1
foreign key (dimension_id)
references dimensions (id)
on delete restrict
;