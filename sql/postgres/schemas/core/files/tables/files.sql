create table files (
    file_id uuid not null,
    tenant_id uuid not null,
    active boolean,
    created_ts timestamp with time zone not null default( now() at time zone 'utc'),

    name varchar(200)
);


comment on table files is 'files';


alter table files
add constraint pk_files
primary key (file_id)
;


alter table files
add constraint fk_files_1
foreign key (tenant_id)
references tenants.tenants (id)
on delete restrict
;


alter table files
add constraint u_files_1
unique (name)
;