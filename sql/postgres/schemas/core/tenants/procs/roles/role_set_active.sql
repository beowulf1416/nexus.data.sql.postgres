create or replace procedure role_set_active(
    p_role_id roles.role_id%type,
    p_active roles.active%type
)
language plpgsql
as $$
begin
    update tenants.roles set
        active = p_active
    where
        role_id = p_role_id
    ;
end
$$;


comment on procedure role_set_active is 'set active state of role';