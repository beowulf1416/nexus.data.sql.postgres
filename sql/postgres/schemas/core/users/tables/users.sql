create table users (
    id uuid not null,
    first_name varchar(100),
    middle_name varchar(100),
    last_name varchar(100),
    prefix varchar(50),
    suffix varchar(50)
);


alter table users
add constraint pk_users
primary key (id)
;