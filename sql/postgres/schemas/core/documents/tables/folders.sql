create table folders (
    tenant_id uuid not null,
    folder_id uuid not null,
    active boolean not null,
    created_ts timestamp with time zone not null default( now() at time zone 'utc'),
    folder_name text not null
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