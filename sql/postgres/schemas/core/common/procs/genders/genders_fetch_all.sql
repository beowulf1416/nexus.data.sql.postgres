create or replace function genders_fetch_all()
returns table (
    id genders.id%type,
    name genders.name%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.name
    from common.genders a
    ;
end
$$;


comment on function genders_fetch_all is 'fetch all genders';