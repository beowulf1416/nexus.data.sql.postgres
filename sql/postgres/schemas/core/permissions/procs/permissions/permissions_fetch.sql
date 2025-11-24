create or replace function permissions_fetch (
    p_filter varchar(100)
)
returns table (
    id permissions.id%type,
    name permissions.name%type,
    description permissions.description%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.name,
        a.description
    from permissions.permissions a
    where
        concat(a.name, a.description) like p_filter
    ;
end
$$;


comment on function permissions_fetch is 'fetch permissions';