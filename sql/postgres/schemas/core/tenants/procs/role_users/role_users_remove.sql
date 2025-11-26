create or replace procedure role_users_remove(
    p_role_ids uuid[],
    p_user_ids uuid[]
)
language plpgsql
as $$
begin
    with cte as (
        select
            a.role_id,
            b.user_id
        from unnest(p_role_ids) a (role_id)
            cross join unnest(p_user_ids) b (user_id)
    )
    delete
    from tenants.role_users a
        using cte c
    where
        a.role_id = c.role_id
        and a.user_id = c.user_id
    ;
end
$$;


comment on procedure role_users_remove is 'remove role assignment from user';