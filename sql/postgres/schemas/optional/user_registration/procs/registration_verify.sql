create or replace procedure registration_verify(
    register_id uuid
)
language plpgsql
as $$
begin
    update user_registration.registrations set
        verified = true
    where
        id = sign_up_id
        and verified = false
    ;
end
$$;

comment on procedure registration_verify is 'mark the user registration with the given id as verified';