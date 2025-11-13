create or replace procedure tenants_set_active(
    tenant_ids uuid[],
    p_active tenants.active%type
)
language plpgsql
as $$
begin
    update tenants.tenants set
        active = p_active
    where
        id = any (tenant_ids)
        and id <> uuid_nil()
    ;
end
$$;


comment on procedure tenants_set_active is 'set active status for multiple tenant records';