create table leave_types (
    id smallint not null,
    name varchar(100) not null
);


comment on table leave_types is 'leave types';
comment on column leave_types.id is 'leave type id';


alter table leave_types
add constraint pk_leave_types
primary key (id)
;


alter table leave_types
add constraint u_leave_types_1
unique (name)
;