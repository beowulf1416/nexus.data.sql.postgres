create table permissions (
    id int not null,
    name varchar(200) not null,
    description text not null
);


comment on table permissions is 'permissions';


alter table permissions
add constraint pk_permissions
primary key (id)
;


alter table permissions
add constraint u_permissions_1
unique (name)
;