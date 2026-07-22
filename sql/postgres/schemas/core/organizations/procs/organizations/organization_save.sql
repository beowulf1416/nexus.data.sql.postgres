create or replace procedure organization_save(
    p_tenant_id organizations.tenant_id%type,
    p_org_id organizations.org_id%type,
    p_parent_org_id organizations.org_id%type,
    p_name organizations.name%type,
    p_description organizations.description%type,
    p_version organizations.version%type
)
language plpgsql
as $$
declare
    v_rows_affected int;
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
        description = p_description,
        updated_ts = now() at time zone 'utc',
        version = organizations.organizations.version + 1
    where
        organizations.organizations.version = p_version
    ;

    get diagnostics v_rows_affected = ROW_COUNT;
    if v_rows_affected <> 1 then
        raise exception 'data has been modified';
    end if;

    insert into organizations.org_tree (
        tenant_id,
        org_id,
        parent_org_id
    ) values (
        p_tenant_id,
        p_org_id,
        p_parent_org_id
    )
    on conflict (org_id)
    do update set
        parent_org_id = p_parent_org_id
    ;
end
$$;

comment on procedure organization_save is 'Saves an organization, creating or updating as necessary.';
