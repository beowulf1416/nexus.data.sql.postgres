create or replace function permission_fetch_by_id(
    p_id permissions.id%type
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
        a.id = p_id
    ;
end
$$;

comment on function permission_fetch_by_id is 'fetch permission by id';