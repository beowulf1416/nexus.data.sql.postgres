create table organizations (
    tenant_id uuid not null,
    org_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    name varchar(200) not null,
    description text
);

comment on table organizations is 'organizations';


alter table organizations
add constraint pk_organizations
primary key (org_id)
;


alter table organizations
add constraint u_organizations_1
unique (tenant_id, org_id)
;


alter table organizations
add constraint fk_organizations_1
foreign key (tenant_id)
references tenants.tenants (id)
on delete restrict
;