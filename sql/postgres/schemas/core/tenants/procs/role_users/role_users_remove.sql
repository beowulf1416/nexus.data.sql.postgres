create or replace procedure role_users_remove(
    p_role_id role_users.role_id%type,
    p_user_ids uuid[]
)
language plpgsql
as $$
begin
    delete
    from tenants.role_users
    where
        role_id = p_role_id
        and user_id = any(p_user_ids)
    ;
end
$$;


comment on procedure role_users_remove is 'remove role assignment from user';