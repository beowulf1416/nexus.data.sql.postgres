create table folders (
    folder_id uuid not null,
    tenant_id uuid not null,
    active boolean,
    created_ts timestamp with time zone not null default( now() at time zone 'utc'),
    name varchar(200) not null
);


comment on table folders is 'folders';


alter table folders
add constraint pk_folders
primary key (folder_id)
;


alter table folders
add constraint fk_folders_1
foreign key (tenant_id)
references tenants.tenants (id)
on delete restrict
;


