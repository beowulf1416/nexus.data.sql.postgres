create or replace procedure roles_set_active(
	role_ids uuid[],
	active boolean
)
language plpgsql
as $$
begin
	update roles set
		active = active
	where
		id = any(role_ids)
		and id <> uuid_nil()
	;
end;
$$;

comment on procedure roles_set_active is 'set active state for multiple roles';
