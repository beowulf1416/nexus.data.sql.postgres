create table dimensions (
    id smallint not null,
    name varchar(50) not null
);

comment on table dimensions is 'dimensions';


alter table dimensions
add constraint pk_dimensions
primary key (id)
;


alter table dimensions
add constraint u_dimensions_1
unique (id)
;