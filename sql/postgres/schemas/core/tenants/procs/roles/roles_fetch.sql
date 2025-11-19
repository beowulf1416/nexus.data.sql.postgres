create or replace function roles_fetch(
    p_tenant_id roles.tenant_id%type,
    p_filter varchar(100)
)
returns table (
    role_id roles.role_id%type,
    active roles.active%type,
    created roles.created_ts%type,
    name roles.name%type,
    description roles.description%type
)
language plpgsql
as $$
begin
    return query
    select
        a.role_id,
        a.active,
        a.created_ts,
        a.name,
        a.description
    from tenants.roles a
    where
        a.tenant_id = p_tenant_id
        and concat(a.name, a.description) like p_filter
    ;
end
$$;


comment on function roles_fetch is 'fetch roles';