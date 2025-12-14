create or replace function location_fetch_by_id(
    p_location_id locations.location_id%type
)
returns table (
    location_id locations.location_id%type,
    active locations.active%type,
    name locations.name%type,
    description locations.description%type
)
language plpgsql
as $$
begin
    return query
    select
        a.location_id,
        a.active,
        a.name,
        a.description
    from mm.locations a
    where
        a.location_id = p_location_id
    ;
end
$$;