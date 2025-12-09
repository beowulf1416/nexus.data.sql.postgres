create or replace procedure tenant_user_set_active(
    p_tenant_id tenant_users.tenant_id%type,
    p_user_id tenant_users.user_id%type,
    p_active tenant_users.active%type
)
language plpgsql
as $$
begin
    update tenants.tenant_users set
        active = p_active
    where
        tenant_id = p_tenant_id
        and user_id = p_user_id
    ;
end
$$;


comment on procedure tenant_user_set_active is 'set active state of tenant user';