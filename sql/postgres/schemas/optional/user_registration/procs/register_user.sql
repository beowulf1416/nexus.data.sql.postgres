create or replace procedure register_user(
    id uuid,
    email common.email
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
        encode(gen_random_bytes(32), 'hex'),
        false
    );
end
$$;

comment on procedure register_user is 'register a new user with given id and email, generating an email verification token';