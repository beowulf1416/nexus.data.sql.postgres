create or replace function organizations_fetch(
    p_tenant_id organizations.tenant_id%type,
    p_filter text
)
returns table (
    org_id organizations.org_id%type,
    active organizations.active%type,
    version organizations.version%type,
    created organizations.created_ts%type,
    updated organizations.updated_ts%type,
    name organizations.name%type,
    description organizations.description%type
)
language plpgsql
as $$
begin
    return query
    select
        a.org_id,
        a.active,
        a.version,
        a.created_ts,
        a.updated_ts,
        a.name,
        a.description
    from organizations.organizations a
    where
        a.tenant_id = p_tenant_id
        and concat(a.name, a.description) ilike p_filter
    ;
end
$$;

comment on function organizations_fetch is 'fetch organizations data for a tenant';
