create or replace procedure person_save(
    p_tenant_id crm.people.tenant_id%type,
    p_people_id crm.people.people_id%type,
    p_first_name crm.people.first_name%type,
    p_middle_name crm.people.middle_name%type,
    p_last_name crm.people.last_name%type,
    p_prefix crm.people.prefix%type,
    p_suffix crm.people.suffix%type,
    p_gender_id crm.people.gender_id%type
)
language plpgsql
as $$
begin
	insert into crm.people (
		tenant_id,
		people_id,
		first_name,
		middle_name,
		last_name,
		prefix,
		suffix,
		gender_id
	)
	values (
		p_tenant_id,
		p_people_id,
		p_first_name,
		p_middle_name,
		p_last_name,
		p_prefix,
		p_suffix,
		p_gender_id
	)
	on conflict (people_id) do
	update set
		tenant_id = p_tenant_id,
		first_name = p_first_name,
		middle_name = p_middle_name,
		last_name = p_last_name,
		prefix = p_prefix,
		suffix = p_suffix,
		gender_id = p_gender_id
	;
end
$$;

comment on procedure person_save is 'add/update a person record';
