create table accounts (
    account_id uuid not null,
    tenant_id uuid not null,
    active boolean not null default true,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    updated_ts timestamp with time zone not null default (now() at time zone 'utc'),

    account_type_id smallint not null,
    account_category_id smallint not null,
    name varchar(300) not null,
    description text,
    code varchar(20),

    constraint pk_accounts
    primary key (account_id),

    constraint u_accounts_1
    unique (tenant_id, name),

    constraint fk_accounts_1
    foreign key (tenant_id)
    references tenants.tenants (tenant_id)
    on delete restrict,

    constraint fk_accounts_2
    foreign key (account_type_id)
    references account_types (account_type_id)
    on delete restrict,

    constraint fk_accounts_3
    foreign key (account_category_id)
    references account_categories (acct_category_id)
    on delete restrict
);

comment on table accounts is 'chart of accounts';
