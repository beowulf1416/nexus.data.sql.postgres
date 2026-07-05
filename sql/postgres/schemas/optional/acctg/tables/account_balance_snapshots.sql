create table account_balance_snapshots (
    account_id uuid not null,
    snapshot_id uuid not null,

    balance money not null,

    constraint pk_account_balance_snapshots
    primary key (account_id, snapshot_id),

    constraint fk_account_balance_snapshots_1
    foreign key (account_id)
    references accounts (account_id)
    on delete restrict,

    constraint fk_account_balance_snapshots_2
    foreign key (snapshot_id)
    references account_balance_snapshots_metadata (snapshot_id)
    on delete restrict
);

comment on table account_balance_snapshots is 'snapshot of account_balances table';
