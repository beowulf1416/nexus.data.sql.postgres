create or replace procedure role_permissions_add (
    p_role_id role_permissions.role_id%type,
    p_permission_id role_permissions.permission_id%type
)
language plpgsql
as $$
begin
    insert into tenants.role_permissions (
        role_id,
        permission_id
    ) values (
        p_role_id,
        p_permission_id
    )
    on conflict do nothing
    ;
end
$$;


comment on procedure role_permissions_add is 'grant permission to role';