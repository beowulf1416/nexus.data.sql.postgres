create table account_hierarchy (
    account_id uuid not null,
    parent_account_id uuid not null,
    tenant_id uuid not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    updated_ts timestamp with time zone not null default (now() at time zone 'utc'),


    constraint pk_account_hierarchy
    primary key (account_id),

    constraint u_account_hierarchy_1
    unique (account_id, parent_account_id),

    constraint fk_account_hierarchy_1
    foreign key (tenant_id)
    references tenants.tenants (tenant_id)
    on delete restrict,

    constraint fk_account_hierarchy_2
    foreign key (account_id)
    references accounts (account_id)
    on delete restrict,

    constraint fk_account_hierarchy_3
    foreign key (parent_account_id)
    references accounts (account_id)
    on delete restrict
);
