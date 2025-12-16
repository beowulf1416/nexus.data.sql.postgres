create table files (
    tenant_id uuid not null,
    file_id uuid not null,
    active boolean not null,
    created_ts timestamp with time zone not null default( now() at time zone 'utc'),
    file_name text not null
);


comment on table files is 'files';


alter table files
add constraint pk_files
primary key (file_id)
;


alter table files
add constraint u_files_1
unique (tenant_id, file_name)
;


alter table files
add constraint fk_files_1
foreign key (tenant_id)
references tenants.tenants (id)
on delete restrict
;