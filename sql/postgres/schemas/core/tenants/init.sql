set schema 'tenants';


insert into tenants.tenants (id, active, name, description) values
(public.uuid_nil(), true, 'default', 'default')
;