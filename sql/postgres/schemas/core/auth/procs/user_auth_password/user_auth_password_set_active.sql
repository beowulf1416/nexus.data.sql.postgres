create or replace procedure user_auth_password_set_active(
    p_user_id user_auth_password.user_id%type,
    p_active user_auth_password.active%type
)
language plpgsql
as $$
begin
    update auth.user_auth_password set
        active = p_active
    where
        user_id = p_user_id
    ;
end
$$;


comment on procedure user_auth_password_set_active is 'enable/disable user password';