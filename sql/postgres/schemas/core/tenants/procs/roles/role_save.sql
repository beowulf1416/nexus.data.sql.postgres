create or replace procedure role_save(
    p_tenant_id roles.tenant_id%type,
    p_role_id roles.role_id%type,
    p_name roles.name%type,
    p_description roles.description%type
)
language plpgsql
as $$
begin
    insert into tenants.roles (
        tenant_id,
        role_id,
        name,
        description
    ) values (
        p_tenant_id,
        p_role_id,
        p_name,
        p_description
    )
    on conflict (role_id) do
    update set
        name = p_name,
        description = p_description
    ;
end
$$;


comment on procedure role_save is 'insert/update role';