create or replace function uom_fetch_all()
returns table (
    uom_id uom.uom_id%type,
    dimension_id uom.dimension_id%type,
    name uom.name%type,
    symbol uom.symbol%type
)
language plpgsql
as $$
begin
    return query
    select
        a.uom_id,
        a.dimension_id,
        a.name,
        a.symbol
    from common.uom a
    ;
end;
$$;

comment on function uom_fetch_all is 'Fetches all units of measure from the common.uom table.';
