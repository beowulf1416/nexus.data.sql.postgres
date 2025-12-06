create or replace function tenant_user_fetch_permissions(
    p_user_id tenant_users.user_id%type
)
returns table (
    permission_id permissions.permissions.id%type,
    name permissions.permissions.name%type
)
language plpgsql
as $$
begin
    return query
    select
        distinct
        c.id,
        c.name
    from tenants.tenant_users a
        join tenants.role_users b
            on a.user_id = b.user_id
        join tenants.role_permissions c
            on b.role_id = c.role_id
        join permissions.permissions d
            on c.permission_id = d.id
        join tenants.roles e
            on b.role_id = e.role_id
    where
        a.user_id = p_user_id
        and b.active = true
        and c.active = true
        and e.active = true
    ;
end
$$;


comment on function tenant_user_fetch_permissions is 'fetch permissions granted to user';