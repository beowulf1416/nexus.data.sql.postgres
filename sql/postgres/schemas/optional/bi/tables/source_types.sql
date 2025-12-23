create table source_types (
    id smallint not null,
    active boolean not null,
    name varchar(100) not null
);


alter table source_types
add constraint pk_source_types
primary key (id)
;


alter table source_types
add constraint uk_source_types_1
unique (name)
;