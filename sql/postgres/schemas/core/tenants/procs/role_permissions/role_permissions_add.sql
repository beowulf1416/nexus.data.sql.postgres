create or replace procedure role_permissions_add (
    p_role_ids uuid[],
    p_permission_ids int[]
)
language plpgsql
as $$
begin
    insert into tenants.role_permissions (
        role_id,
        permission_id
    )
    select
        a.role_id,
        b.permission_id
    from unnest(p_role_ids) a (role_id)
        cross join unnest(p_permission_ids) b (permission_id)
    ;
end
$$;


comment on procedure role_permissions_add is 'grant permission to role';