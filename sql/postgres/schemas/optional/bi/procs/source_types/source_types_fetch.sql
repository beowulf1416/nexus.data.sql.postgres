create or replace function source_types_fetch()
returns table (
    id source_types.id%type,
    active source_types.active%type
    name source_types.name%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.name
    from bi.source_types a
    ;
end
$$;

comment on function source_types_fetch is 'fetch source types';