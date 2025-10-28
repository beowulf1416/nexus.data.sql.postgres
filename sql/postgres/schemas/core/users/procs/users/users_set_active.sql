create or replace procedure users_set_active(
    p_user_id users.id%type,
    p_active users.active%type
)
language plpgsql
as $$
begin
    update users.users set
        active = p_active
    where
        id = p_user_id
    ;
end
$$;

comment on procedure users_set_active is 'set user record state to active/inactive';