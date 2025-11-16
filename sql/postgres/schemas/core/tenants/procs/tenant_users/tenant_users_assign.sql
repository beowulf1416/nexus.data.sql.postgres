create or replace procedure tenant_users_assign(
    tenant_ids uuid[],
    user_ids uuid[]
)
language plpgsql
as $$
begin
    insert into tenants.tenant_users (
        tenant_id,
        user_id
    )
    select
        a.tenant_id,
        b.user_id
    from unnest(tenant_ids) a (tenant_id)
        cross join unnest(user_ids) b (user_id)
    on conflict (tenant_id, user_id)
    do nothing
    ;
end
$$;


comment on procedure tenant_users_assign is 'assign multiple users to multiple tenants';