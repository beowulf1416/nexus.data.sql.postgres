create or replace function users_fetch_by_id(
    p_user_id users.id%type
)
returns table (
    user_id users.id%type,
    active users.active%type,
    created users.created_ts%type,
    first_name users.first_name%type,
    middle_name users.middle_name%type,
    last_name users.last_name%type,
    prefix users.prefix%type,
    suffix users.suffix%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.active,
        a.created_ts,
        a.first_name,
        a.middle_name,
        a.last_name,
        a.prefix,
        a.suffix
    from users.users a
    where
        a.id = p_user_id
    ;
end
$$;

comment on function users_fetch_by_id is 'fetch user record by id';