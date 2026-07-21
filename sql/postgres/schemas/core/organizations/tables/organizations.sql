create table organizations (
    tenant_id uuid not null,
    org_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    name varchar(200) not null,
    description text,

    constraint pk_organizations
    primary key (org_id),

    constraint u_organizations_1
    unique (tenant_id, org_id),

    constraint u_organizations_2
    unique (tenant_id, name),

    constraint fk_organizations_1
    foreign key (tenant_id)
    references tenants.tenants (tenant_id)
    on delete restrict
);

comment on table organizations is 'organizations';
