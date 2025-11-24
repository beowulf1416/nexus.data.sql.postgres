create table role_permissions (
    role_id uuid not null,
    permission_id int not null,
    active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc')
);


comment on table role_permissions is 'permissions granted to role';



alter table role_permissions
add constraint pk_role_permissions
primary key (role_id, permission_id)
;


alter table role_permissions
add constraint fk_role_permissions_1
foreign key (role_id)
references roles (role_id)
on delete restrict
;


alter table role_permissions
add constraint fk_role_permissions_2
foreign key (permission_id)
references permissions.permissions (id)
on delete restrict
;
