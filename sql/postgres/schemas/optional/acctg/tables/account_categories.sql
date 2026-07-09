-- https://www.scribd.com/document/546561836/Types-of-Accounts
create table account_categories (
    acct_category_id smallint not null,
    name varchar(100) not null,
    sub_name varchar(100) not null,

    constraint pk_account_categories
    primary key (acct_category_id),

    constraint u_account_categories_1
    unique (name, sub_name)
);

comment on table account_categories is 'categories of accounts';
