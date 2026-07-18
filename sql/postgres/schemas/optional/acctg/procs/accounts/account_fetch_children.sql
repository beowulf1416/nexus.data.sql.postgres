create or replace function account_fetch_children(
  p_account_id accounts.account_id%type
)
returns table (
    account_id accounts.account_id%type,
    active accounts.active%type,
    account_type_id accounts.account_type_id%type,
    account_category_id accounts.account_category_id%type,
    name accounts.name%type,
    code accounts.code%type,
    description accounts.description%type
)
language plpgsql
as $$
begin
    return query
    select
        a.account_id,
        a.active,
        a.account_type_id,
        a.account_category_id,
        a.name,
        a.code,
        a.description
    from acctg.accounts a
        join acctg.account_hierarchy b
            on a.account_id = b.account_id
    where
        b.parent_account_id = p_account_id
    ;
end;
$$;

comment on function account_fetch_children is 'Fetches the children of a given account.';
