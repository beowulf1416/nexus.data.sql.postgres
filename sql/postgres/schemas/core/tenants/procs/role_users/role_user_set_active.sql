create or replace procedure role_user_set_active(
    p_role_id role_users.role_id%type,
    p_user_id role_users.user_id%type,
    p_active role_users.active%type
)
language plpgsql
as $$
begin
    update tenants.role_users set
        active = p_active
    where
        role_id = p_role_id
        and user_id = p_user_id
    ;
end
$$;


comment on procedure role_user_set_active is 'set active state of role user record';