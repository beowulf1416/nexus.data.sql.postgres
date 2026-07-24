create or replace function partner_fetch_by_id(
    p_partner_id partners.partner_id%type
)
returns table (
    partner_id partners.partner_id%type,
    active partners.active%type,
    created_ts partners.created_ts%type,
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
    	a.active,
    	a.created_ts,
    	a.business_name,
    	a.description,
    	a.first_name,
    	a.middle_name,
    	a.last_name,
    	a.prefix,
    	a.suffix
    from crm.partners a
    where
    	a.partner_id = p_partner_id
    ;
end;
$$;

comment on function partner_fetch_by_id is 'fetch partner';
