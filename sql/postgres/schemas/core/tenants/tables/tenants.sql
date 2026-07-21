create table tenants (
    tenant_id uuid not null,
    active boolean not null default false,
    version int not null default 0,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    updated_ts timestamp with time zone not null default (now() at time zone 'utc'),
    name varchar(100) not null,
    description text,

    constraint pk_tenants
    primary key (tenant_id),

    constraint u_tenants_1
    unique (name)
);

comment on table tenants.tenants is 'table of tenants';
