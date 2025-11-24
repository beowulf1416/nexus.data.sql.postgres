create or replace procedure role_permissions_remove (
    p_role_id role_permissions.role_id%type,
    p_permission_id role_permissions.permission_id%type
)
language plpgsql
as $$
begin
    delete
    from tenants.role_permissions
    where
        role_id = p_role_id
        and permission_id = p_permission_id
    ;
end
$$;


comment on procedure role_permissions_remove is 'revoke permission from role';