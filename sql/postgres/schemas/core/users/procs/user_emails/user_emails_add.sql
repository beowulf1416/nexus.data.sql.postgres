create or replace procedure user_emails_add(
    p_user_id user_emails.user_id%type,
    p_email user_emails.email%type
)
language plpgsql
as $$
begin
    insert into users.user_emails (
        user_id,
        email
    ) values (
        p_user_id,
        p_email
    );
end
$$;

comment on procedure user_emails_add is 'add user email';