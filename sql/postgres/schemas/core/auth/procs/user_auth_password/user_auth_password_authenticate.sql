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
        join users.users b
            on a.user_id = b.id
    where
        a.email = p_email
        and b.active = true
    ;

    return t_authentic;
    
exception
    when no_data_found then
        return false;
end
$$;

comment on function user_auth_password_authenticate is 'authenticate user using a password';