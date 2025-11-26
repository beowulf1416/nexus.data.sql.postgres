create or replace procedure role_users_add(
    p_role_ids uuid[],
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
        a.role_id,
        b.user_id
    from unnest(p_role_ids) a(role_id)
        cross join unnest(p_user_ids) b(user_id)
    on conflict (role_id, user_id)
    do nothing
    ;
end
$$;

comment on procedure role_users_add is 'assign user to role';