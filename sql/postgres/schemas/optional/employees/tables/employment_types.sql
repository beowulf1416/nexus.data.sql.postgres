create table employment_types (
    id smallint not null,
    name varchar(100) not null
);

comment on table employment_types is 'employment types';


alter table employment_types
add constraint pk_employment_types
primary key (id)
;


alter table employment_types
add constraint u_employment_types_1
unique (name)
;