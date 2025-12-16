create table tags (
    tenant_id uuid not null,
    tag_id uuid not null,
    active boolean not null,
    created_ts timestamp with time zone not null default( now() at time zone 'utc'),
    tag varchar(100) not null
);


comment on table tags is 'tags';


alter table tags
add constraint pk_tags
primary key (tag_id)
;


alter table tags
add constraint u_tags_1
unique (tenant_id, tag)
;


alter table tags
add constraint fk_tags_1
foreign key (tenant_id)
references tenants.tenants (id)
on delete restrict
;