create or replace procedure get_details(
    token text
)
language plpgsql
as $$
begin
    select
        id,
        email
    from user_registration.registrations
    where
        token = token
        and verified = false
    ;
end
$$;

comment on procedure get_details is 'get the details of a user registration by token if not yet verified';