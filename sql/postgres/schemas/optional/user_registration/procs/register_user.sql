create or replace procedure register_user(
    id registrations.id%type,
    email registrations.email%type,
    token registrations.token%type
)
language plpgsql
as $$
begin
    insert into user_registration.registrations (
        id,
        email,
        token,
        verified
    ) values (
        id,
        email,
        token,
        false
    );
end
$$;

comment on procedure register_user is 'register a new user with given id and email, generating an email verification token';