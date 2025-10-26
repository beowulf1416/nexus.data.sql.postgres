create or replace procedure user_auth_password_save (
    p_user_id user_auth_password.user_id%type,
    p_email user_auth_password.email%type,
    p_pw user_auth_password.pw%type
)
language plpgsql
as $$
begin
    call auth.user_auth_add(p_user_id, 1::smallint);

    insert into auth.user_auth_password (
        user_id,
        email,
        pw
    ) values (
        p_user_id,
        p_email,
        public.crypt(p_pw, public.gen_salt('md5'))
    )
    on conflict (user_id) do
    update set
        pw = public.crypt(p_pw, public.gen_salt('md5'))
    ;
end
$$;


comment on procedure user_auth_password_save is 'insert/update user auth using password';