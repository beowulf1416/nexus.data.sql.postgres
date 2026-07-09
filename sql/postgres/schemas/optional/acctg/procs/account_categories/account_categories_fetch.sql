create or replace function account_categories_fetch()
returns table (
    acct_category_id account_categories.acct_category_id%type,
    name account_categories.name%type,
    sub_name account_categories.sub_name%type
)
language plpgsql
as $$
begin
  return query
  select
    a.acct_category_id,
    a.name,
    a.sub_name
  from acctg.account_categories a
  ;
end;
$$;


comment on function account_categories_fetch() is 'fetch all the account categories';
