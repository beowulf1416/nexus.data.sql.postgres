create or replace function organization_fetch_by_id(
    p_org_id organizations.org_id%type
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
        a.org_id = p_org_id
    ;
end
$$;

comment on function organization_fetch_by_id is 'fetch organization data for a tenant using organization id';
