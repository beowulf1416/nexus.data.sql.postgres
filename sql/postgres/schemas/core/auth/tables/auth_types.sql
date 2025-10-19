create table auth_types (
    id smallint not null,
    name varchar(100) not null
);

alter table auth_types
add constraint pk_auth_types
primary key (id)
;