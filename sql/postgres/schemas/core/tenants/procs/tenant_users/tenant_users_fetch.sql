create or replace function tenant_users_fetch(
    p_tenant_id tenant_users.tenant_id%type,
    p_filter varchar(50)
)
returns table (
    user_id tenant_users.user_id%type,
    active tenant_users.active%type,
    first_name users.users.first_name%type,
    middle_name users.users.middle_name%type,
    last_name users.users.last_name%type,
    prefix users.users.prefix%type,
    suffix users.users.suffix%type,
    email users.user_emails.email%type
)
language plpgsql
as $$
begin
    return query
    select
        a.user_id,
        a.active,
        b.first_name,
        b.middle_name,
        b.last_name,
        b.prefix,
        b.suffix,
        c.email
    from tenants.tenant_users a
        join users.users b
            on a.user_id = b.id
        join users.user_emails c
            on b.id = c.user_id
    where
        a.tenant_id = p_tenant_id
        and concat(b.first_name, b.middle_name, b.last_name, c.email) like p_filter
    ;
end
$$;


comment on function tenant_users_fetch is 'fetch users assigned to tenant';