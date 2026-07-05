create table account_types (
    account_type_id smallint not null,
    name varchar(100),

    constraint pk_account_types
    primary key (account_type_id),

    constraint u_account_types_1
    unique (name)
);

comment on table account_types is 'account types';
