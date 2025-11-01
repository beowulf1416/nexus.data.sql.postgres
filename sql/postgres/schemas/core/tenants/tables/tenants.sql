create table tenants (
    id uuid not null,
    active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    name varchar(100) not null,
    description text
);

alter table tenants
add constraint pk_tenants
primary key (id)
;


alter table tenants
add constraint u_tenants_1
unique (name)
;