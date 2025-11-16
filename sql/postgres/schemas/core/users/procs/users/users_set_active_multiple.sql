create or replace procedure users_set_active_multiple(
    user_ids uuid[],
    p_active users.active%type
)
language plpgsql
as $$
begin
    update users.users set
        active = p_active
    where
        id = any(user_ids)
    ;
end
$$;

comment on procedure users_set_active_multiple is 'set multiple user records state to active/inactive';