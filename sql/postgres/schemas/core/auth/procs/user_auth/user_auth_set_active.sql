create or replace procedure user_auth_set_active(
    p_user_id user_auth.user_id%type,
    p_active user_auth.active%type
)
language plpgsql
as $$
begin
    update auth.user_auth set
        active = p_active
    where
        user_id = p_user_id
    ;
end
$$;


comment on procedure user_auth_set_active is 'enable/disable user authentication method for user';