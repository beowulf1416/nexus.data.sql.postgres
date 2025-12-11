create or replace procedure role_permission_set_active(
    p_role_id role_permissions.role_id%type,
    -- p_permission_id role_permissions.permission_id%type,
    p_permission_ids int[],
    p_active role_permissions.active%type
)
language plpgsql
as $$
begin
    update tenants.role_permissions set
        active = p_active
    where
        role_id = p_role_id
        and permission_id = any(p_permission_ids)
    ;
end
$$;


comment on procedure role_permission_set_active is 'set active state of role permission';