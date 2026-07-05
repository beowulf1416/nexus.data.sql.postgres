create table account_balances (
    account_id uuid not null,

    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    updated_ts timestamp with time zone not null default (now() at time zone 'utc'),

    balance money not null,

    constraint pk_account_balances
    primary key (account_id),

    constraint fk_account_balances
    foreign key (account_id)
    references accounts (account_id)
    on delete restrict
);

comment on table account_balances is 'balances of the accounts';
