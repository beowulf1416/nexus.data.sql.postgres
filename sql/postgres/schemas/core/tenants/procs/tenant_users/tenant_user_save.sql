create or replace procedure tenant_user_save(
    p_tenant_id tenant_users.tenant_id%type,
    p_user_id tenant_users.user_id%type
)
language plpgsql
as $$
begin
    insert into tenants.tenant_users (
        tenant_id,
        user_id
    ) values (
        p_tenant_id,
        p_user_id
    )
    on conflict (tenant_id, user_id) do nothing
    ;
end
$$;


comment on procedure tenant_user_save is 'assign user to tenant';