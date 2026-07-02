create or replace procedure tenant_set_active(
    p_tenant_id tenants.tenant_id%type,
    p_active tenants.active%type
)
language plpgsql
as $$
begin
    update tenants.tenants set
        active = p_active
    where
        tenant_id = p_tenant_id
        and tenant_id <> uuid_nil()
    ;
end
$$;

comment on procedure tenant_set_active is 'set tenant active field';
