create or replace procedure partners_set_active(
    p_partner_ids uuid[],
    p_active boolean
)language plpgsql
as $$
begin
    update crm.partners set
        active = p_active
    where
        partner_id = any(p_partner_ids)
    ;
end;
$$;

comment on procedure partners_set_active is 'set partner record active state';
