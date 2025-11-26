create or replace procedure role_permissions_remove (
    p_role_ids uuid[],
    p_permission_ids int[]
)
language plpgsql
as $$
begin
    with cte as (
        select
            b.role_id,
            c.permission_id
        from unnest(p_role_ids) b (role_id)
            cross join unnest(p_permission_ids) c (permission_id)
    )
    delete
    from tenants.role_permissions a
        using cte c
    where
        a.role_id = c.role_id
        and a.permission_id = c.permission_id
    ;
end
$$;


comment on procedure role_permissions_remove is 'revoke permission from role';