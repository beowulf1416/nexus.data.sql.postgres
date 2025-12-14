create or replace procedure location_save(
    p_tenant_id locations.tenant_id%type,
    p_location_id locations.location_id%type,
    p_name locations.name%type,
    p_description locations.description%type
)
language plpgsql
as $$
begin
    insert into mm.locations (
        tenant_id,
        location_id,
        active,
        name,
        description
    ) values (
        p_tenant_id,
        p_location_id,
        true,
        p_name,
        p_description
    ) on conflict (location_id) do
    update set
        name = p_name,
        description = p_description
    ;
end
$$;


comment on procedure location_save is 'save location record';