create or replace procedure partner_save(
    p_tenant_id partners.tenant_id%type,
    p_partner_id partners.partner_id%type,
    p_business_name partners.business_name%type,
    p_description partners.description%type,
    p_first_name partners.first_name%type,
    p_middle_name partners.middle_name%type,
    p_last_name partners.last_name%type,
    p_prefix partners.prefix%type,
    p_suffix partners.suffix%type
)
language plpgsql
as $$
begin
	insert into crm.partners (
		tenant_id,
		partner_id,
		business_name,
		description,
		first_name,
		middle_name,
		last_name,
		prefix,
		suffix
	)
	values (
		p_tenant_id,
		p_partner_id,
		p_business_name,
		p_description,
		p_first_name,
		p_middle_name,
		p_last_name,
		p_prefix,
		p_suffix
	)
	on conflict (partner_id) do
	update set
		business_name = p_business_name,
		description = p_description,
		first_name = p_first_name,
		middle_name = p_middle_name,
		last_name = p_last_name,
		prefix = p_prefix,
		suffix = p_suffix
	;
end
$$;
