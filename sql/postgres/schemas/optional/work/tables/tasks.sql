create table tasks (
    tenant_id uuid not null,
    project_id uuid not null,
    task_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    name varchar(200) not null,
    description text
);

comment on table tasks is 'project tasks';


alter table tasks
add constraint pk_tasks
primary key (task_id)
;

alter table tasks
add constraint u_tasks_1
unique (tenant_id, project_id, task_id)
;

alter table tasks
add constraint fk_tasks_1
foreign key (tenant_id)
references tenants.tenants (tenant_id)
on delete restrict
;

alter table tasks
add constraint fk_tasks_2
foreign key (project_id)
references projects (project_id)
on delete restrict
;