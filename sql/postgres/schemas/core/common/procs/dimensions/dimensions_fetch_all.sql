create or replace function dimensions_fetch_all()
returns table (
    dimension_id dimensions.dimension_id%type,
    name dimensions.name%type
)
language plpgsql
as $$
begin
    return query
    select
        a.dimension_id,
        a.name
    from common.dimensions a
    ;
end;
$$;

comment on function dimensions_fetch_all is 'Fetches all dimensions from the common.dimensions table.';
