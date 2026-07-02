create table partners (
    tenant_id uuid not null,
    partner_id uuid not null,

    active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),

    business_name varchar(300),
    description text,

    first_name varchar(100),
    middle_name varchar(100),
    last_name varchar(100),
    prefix varchar(100),
    suffix varchar(100),

    constraint pk_partners
    primary key (partner_id),

    constraint fk_partners_1
    foreign key (tenant_id)
    references tenants.tenants (tenant_id)
    on delete restrict,

    constraint chk_partners_1
    check (
        business_name is not null
        or concat(first_name, middle_name, last_name) is not null
    )
);
