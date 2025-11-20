create or replace procedure role_users_add(
    p_role_id role_users.role_id%type,
    p_user_ids uuid[]
)
language plpgsql
as $$
begin
    insert into tenants.role_users (
        role_id,
        user_id,
        active
    )
    select
        p_role_id,
        a.user_id
    from unnest(p_user_ids) a(user_id)
    on conflict (role_id, user_id)
    do nothing
    ;
end
$$;

comment on procedure role_users_add is 'assign user to role';