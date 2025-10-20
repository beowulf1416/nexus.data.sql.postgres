create or replace procedure register_user(
    p_register_id registrations.id%type,
    p_email registrations.email%type,
    p_token registrations.token%type
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
        p_register_id,
        p_email,
        p_token,
        false
    );
end
$$;

comment on procedure register_user is 'register a new user with given id and email, generating an email verification token';