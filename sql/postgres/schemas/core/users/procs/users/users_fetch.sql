create or replace function users_fetch(
    p_filter varchar(100)
)
returns table (
    user_id users.id%type,
    active users.active%type,
    created users.created_ts%type,
    first_name users.first_name%type,
    middle_name users.middle_name%type,
    last_name users.last_name%type,
    prefix users.prefix%type,
    suffix users.suffix%type,
    email user_emails.email%type
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
        a.suffix,
        b.email
    from users.users a
        join users.user_emails b
            on a.id = b.user_id
    where
        concat(a.first_name, a.middle_name, a.last_name) like p_filter
    ;
end
$$;

comment on function users_fetch is 'fetch matching users';