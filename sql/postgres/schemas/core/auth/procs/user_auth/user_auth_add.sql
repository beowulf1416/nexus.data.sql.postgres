create or replace procedure user_auth_add (
    p_user_id users.users.id%type,
    p_auth_type_id auth_types.id%type
)
language plpgsql
as $$
begin
    insert into auth.user_auth (
        user_id,
        active,
        auth_type_id
    ) values (
        p_user_id,
        true,
        p_auth_type_id
    )
    on conflict (user_id, auth_type_id) do
        nothing
    ;
end
$$;

comment on procedure user_auth_add is 'add authentication type for user';