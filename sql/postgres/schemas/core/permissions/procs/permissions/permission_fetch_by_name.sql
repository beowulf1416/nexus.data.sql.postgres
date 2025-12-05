create or replace function permission_fetch_by_name(
    p_name permissions.name%type
) returns table (
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
        a.name = p_name
    ;
end
$$;

comment on function permission_fetch_by_name is 'fetch permission by name';