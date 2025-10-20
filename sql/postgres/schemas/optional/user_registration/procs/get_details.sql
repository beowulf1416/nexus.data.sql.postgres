create or replace function get_details(
    p_token registrations.token%type
)
returns table (
    id registrations.id%type,
    email registrations.email%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.email
    from user_registration.registrations a
    where
        a.token = p_token
        and a.verified = false
    ;
end
$$;

comment on function get_details is 'get the details of a user registration by token if not yet verified';