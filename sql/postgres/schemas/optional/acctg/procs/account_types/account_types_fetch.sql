create or replace function account_types_fetch()
returns table (
    account_type_id account_types.account_type_id%type,
    name account_types.name%type
)
language plpgsql
as $$
begin
    return query
    select
        a.account_type_id,
        a.name
    from acctg.account_types a
    ;
end
$$;

comment on function account_types_fetch() is 'Fetches all account types from the account_types table.';
