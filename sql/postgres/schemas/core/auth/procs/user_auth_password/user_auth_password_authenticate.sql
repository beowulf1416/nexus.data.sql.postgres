create or replace function user_auth_password_authenticate(
    p_email user_auth_password.email%type,
    p_pw user_auth_password.pw%type
)
returns boolean
language plpgsql
as $$
declare
    t_authentic boolean:= false;
begin
    select
        a.pw = public.crypt(p_pw, a.pw)
        into strict
        t_authentic
    from auth.user_auth_password a
        join auth.user_auth b
            on a.user_id = b.user_id
        join users.users c
            on a.user_id = c.id
    where
        a.email = p_email
        -- the user's password is enabled
        and a.active = true
        -- the authentication method for this user is enabled
        and b.active = true
        -- the user's record is enabled
        and c.active = true
    ;

    return t_authentic;
    
exception
    when no_data_found then
        return false;
end
$$;

comment on function user_auth_password_authenticate is 'authenticate user using a password';