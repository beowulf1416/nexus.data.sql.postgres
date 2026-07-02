create or replace function partners_fetch(
    p_tenant_id partners.tenant_id%type,
    p_filter text
)
returns table (
    partner_id partners.partner_id%type,
    business_name partners.business_name%type,
    description partners.description%type,
    first_name partners.first_name%type,
    middle_name partners.middle_name%type,
    last_name partners.last_name%type,
    prefix partners.prefix%type,
    suffix partners.suffix%type
)
language plpgsql
as $$
begin
    return query
    select
    	a.partner_id,
    	a.business_name,
    	a.description,
    	a.first_name,
    	a.middle_name,
    	a.last_name,
    	a.prefix,
    	a.suffix
    from crm.partners a
    where
    	a.tenant_id = p_tenant_id
        and (
	        a.business_name ilike p_filter
	        or concat_ws(' ', a.first_name, a.middle_name, a.last_name) ilike p_filter
        )
    ;
end;
$$;

comment on function partners_fetch is 'fetch partners';
