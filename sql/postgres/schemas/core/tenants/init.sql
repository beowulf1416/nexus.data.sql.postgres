set schema 'tenants';


insert into tenants.tenants (tenant_id, active, name, description) values
(public.uuid_nil(), true, 'default', 'default')
;
