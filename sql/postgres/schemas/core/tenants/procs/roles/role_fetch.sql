create or replace function role_fetch(
	p_role_id uuid
)
returns table (
	role_id roles.role_id%type,
	active roles.active%type,
	created roles.created_ts%type,
	name roles.name%type,
	description roles.description%type
)
language plpgsql
as $$
begin
	return query
	select
	    a.role_id,
	    a.active,
	    a.created_ts,
	    a.name,
	    a.description
	from tenants.roles a
	where
	    a.role_id = p_role_id
	;
end;
$$;

comment on function role_fetch is 'fetch a role by its id';
