create table item_balances (
    item_id uuid not null,
    updated_ts timestamp with time zone not null default (now() at time zone 'utc'),
    amount decimal(12,8) not null
);


comment on table item_balances is 'item balances'
;


alter table item_balances
add constraint pk_item_balances
primary key (item_id)
;


