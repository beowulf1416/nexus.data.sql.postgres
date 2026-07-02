create or replace procedure partner_set_active(
    p_partner_ids uuid[],
    p_active boolean
)
language plpgsql
as $$
begin
    update crm.partners set
    	active = p_active
    where
    	partner_id = p_partner_id
    ;
end;
$$;

comment on procedure partner_set_active is 'set the active state of a partner record';
