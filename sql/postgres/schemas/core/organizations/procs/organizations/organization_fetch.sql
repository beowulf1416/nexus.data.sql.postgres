create or replace function organization_fetch(
    p_organization_id organizations.org_id%type
)
returns table(
    org_id organizations.org_id%type,
    active organizations.active%type,
    created organizations.created_ts%type,
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
        a.created_ts,
        a.name,
        a.description
    from organizations.organizations a
    where
        a.org_id = p_organization_id
    ;
end
$$;

comment on function organization_fetch is 'Fetches an organization by its ID';
