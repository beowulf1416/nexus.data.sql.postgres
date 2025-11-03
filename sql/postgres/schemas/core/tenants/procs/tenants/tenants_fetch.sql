create or replace function tenants_fetch(
    p_filter varchar(100)
)
returns table (
    tenant_id tenants.id%type,
    active tenants.active%type,
    created tenants.created_ts%type,
    name tenants.name%type,
    description tenants.description%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.created_ts,
        a.name,
        a.description
    from tenants.tenants a
    where
        concat(a.name, a.description) like p_filter
    ;
end
$$;


comment on function tenants_fetch is 'fetch tenant records';