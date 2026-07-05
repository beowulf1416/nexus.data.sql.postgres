create table account_balance_snapshots_metadata (
    snapshot_id uuid not null,
    tenant_id uuid not null,

    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    updated_ts timestamp with time zone not null default (now() at time zone 'utc'),

    constraint pk_account_balance_snapshots_metadata
    primary key (snapshot_id),

    constraint fk_account_balance_snapshots_metadata_1
    foreign key (tenant_id)
    references tenants.tenants (tenant_id)
    on delete restrict
);

comment on table account_balance_snapshots_metadata is 'snapshot metadata';
