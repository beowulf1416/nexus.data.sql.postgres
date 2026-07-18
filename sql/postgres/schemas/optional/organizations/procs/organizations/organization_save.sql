create or replace procedure organization_save(
    p_tenant_id organizations.tenant_id%type,
    p_org_id organizations.org_id%type,
    p_name organizations.name%type,
    p_description organizations.description%type
)
language plpgsql
as $$
begin
    insert into organizations.organizations (
        tenant_id,
        org_id,
        active,
        name,
        description
    )
    values (
        p_tenant_id,
        p_org_id,
        true,
        p_name,
        p_description
    )
    on conflict (org_id)
    do update set
        active = true,
        name = p_name,
        description = p_description
    ;
end
$$;

comment on procedure organization_save is 'Saves an organization, creating or updating as necessary.';
