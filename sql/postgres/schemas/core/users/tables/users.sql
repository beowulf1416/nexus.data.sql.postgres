create table users (
    id uuid not null
);


alter table users
add constraint pk_users
primary key (id)
;