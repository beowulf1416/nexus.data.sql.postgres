create or replace function user_auth_password_fetch(
    p_user_id user_auth_password.user_id%type
)
returns table (
    user_id user_auth_password.user_id%type,
    email user_auth_password.email%type
)
language plpgsql
as $$
begin
    return query
    select
        a.user_id,
        a.email
    from auth.user_auth_password a
    where
        a.user_id = p_user_id
    ;
end
$$;

comment on function user_auth_password_fetch is 'fetch associated user authentication details';