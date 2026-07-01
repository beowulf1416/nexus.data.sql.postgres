create or replace function partners_fetch(
    p_tenant_id crm.partners.tenant_id%type,
    p_filter text
)
returns table (
    partner_id crm.partners.partner_id%type,
    name crm.partners.name%type,
    description crm.partners.description%type
)
language plpgsql
as $$
begin
    return query
    select
    	a.partner_id,
    	a.name,
    	a.description
    from crm.partners a
    where
    	a.tenant_id = p_tenant_id
        and a.name ilike p_filter
    ;
end;
$$;
