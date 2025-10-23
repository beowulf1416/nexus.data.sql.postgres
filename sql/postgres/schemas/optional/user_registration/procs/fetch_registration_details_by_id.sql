create or replace function fetch_registration_details_by_id(
    p_register_id registrations.id%type
)
returns table (
    id registrations.id%type,
    email registrations.email%type,
    token registrations.token%type
)
language plpgsql
as $$
begin
    return query
    select
        a.id,
        a.email,
        a.token
    from user_registration.registrations a
    where
        a.id = p_register_id
        and a.verified = false
    ;
end
$$;

comment on function fetch_registration_details_by_id is 'fetch the details of a user registration by token if not yet verified';