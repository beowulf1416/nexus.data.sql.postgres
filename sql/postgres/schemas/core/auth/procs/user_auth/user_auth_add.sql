create or replace procedure user_auth_add (
    p_user_id users.users.id%type,
    p_auth_type_id auth_types.id%type
)
