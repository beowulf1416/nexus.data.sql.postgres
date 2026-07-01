create or replace view partners
as
select
	tenant_id,
    people_id partner_id,
    concat(prefix, first_name, middle_name, last_name, suffix) name,
    concat(prefix, first_name, middle_name, last_name, suffix) description
from crm.people
union
select
	tenant_id,
    business_id partner_id,
    name,
    description
from crm.businesses
;
