create table tenant_users (
    tenant_id uuid not null,
    user_id uuid not null,
    active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc')
);


alter table tenant_users
add constraint pk_tenant_users
primary key (tenant_id, user_id)
;


alter table tenant_users
add constraint fk_tenant_users_1
foreign key (tenant_id)
references tenants (id)
on delete restrict
;


alter table tenant_users
add constraint fk_tenant_users_2
foreign key (user_id)
references users.users (id)
on delete restrict
;