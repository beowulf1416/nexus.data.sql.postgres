create or replace function currencies_fetch_all()
returns table (
    currency_id currencies.currency_id%type,
    currency currencies.currency%type,
    unit_text currencies.unit_text%type,
    symbol currencies.symbol%type
)
language plpgsql
as $$
begin
    return query
    select
        a.currency_id,
        a.currency,
        a.unit_text,
        a.symbol
    from common.currencies a
    ;
end
$$;


comment on function currencies_fetch_all is 'fetch all currencies';
