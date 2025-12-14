create or replace procedure location_set_active(
    p_location_id locations.location_id%type,
    p_active locations.active%type 
)
language plpgsql
as $$
begin
    update mm.locations set
        active = p_active
    where 
        location_id = p_location_id
    ;
end
$$;


comment on procedure location_set_active is 'set location active status';