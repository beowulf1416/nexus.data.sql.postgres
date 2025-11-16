create table roles(
    tenant_id uuid not null,
    role_id uuid not null,
    active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    name varchar(100) not null,
    description text
);


comment on table roles is 'roles';


alter table roles
add constraint pk_roles
primary key (role_id)
;


alter table roles
add constraint u_roles_1
unique (tenant_id, role_id)
;


alter table roles
add constraint u_roles_2
unique (tenant_id, name)
;


alter table roles
add constraint fk_roles_1
foreign key (tenant_id)
references tenants (id)
on delete restrict
;