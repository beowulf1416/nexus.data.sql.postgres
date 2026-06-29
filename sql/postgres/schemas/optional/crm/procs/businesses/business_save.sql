create or replace procedure business_save(
    p_tenant_id uuid,
    p_business_id uuid,
    p_name varchar(100),
    p_description varchar(300)
)
as $$
begin
	insert into crm.businesses (
		tenant_id,
		business_id,
		name,
		description
	)
	values (
		p_tenant_id,
		p_business_id,
		p_name,
		p_description
	)
	on conflict (business_id) do
	update set
		name = p_name,
		description = p_description
	;
end;
$$ language plpgsql;
