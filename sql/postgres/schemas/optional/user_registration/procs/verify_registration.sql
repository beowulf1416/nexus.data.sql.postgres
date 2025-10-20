create or replace procedure verify_registration(
    p_register_id registrations.id%type,
    p_token registrations.token%type
)
language plpgsql
as $$
begin
    update user_registration.registrations set
        verified = true
    where
        id = p_register_id
        and token = p_token
        and verified = false
    ;
end
$$;

comment on procedure verify_registration is 'mark the user registration with the given id as verified';