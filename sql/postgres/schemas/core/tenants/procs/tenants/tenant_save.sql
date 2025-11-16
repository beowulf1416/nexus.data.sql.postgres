create or replace procedure tenant_save(
    p_tenant_id tenants.id%type,
    p_name tenants.name%type,
    p_description tenants.description%type
)
language plpgsql
as $$
begin
    
    insert into tenants.tenants (
        id,
        name,
        description
    ) values (
        p_tenant_id,
        p_name,
        p_description
    )
    on conflict (id) do
    update set
        name = p_name,
        description = p_description
    ;
end
$$;

comment on procedure tenant_save is 'save tenant record';