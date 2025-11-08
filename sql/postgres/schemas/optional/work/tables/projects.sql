create table projects (
    tenant_id uuid not null,
    project_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default(now() at time zone 'utc'),
    name varchar(200) not null,
    description text
);

comment on table projects is 'Projects';


alter table projects
add constraint pk_projects
primary key (project_id)
;

alter table projects
add constraint u_projects_1
unique (tenant_id, project_id)
;

alter table projects
add constraint fK_projects_1
foreign key (tenant_id)
references tenants.tenants (id)
;