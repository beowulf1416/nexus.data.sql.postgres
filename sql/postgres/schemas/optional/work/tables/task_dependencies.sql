create table task_dependencies (
    task_id uuid not null,
    dependend_task_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc')
);


alter table task_dependencies
add constraint pk_task_dependencies
primary key (task_id, dependend_task_id)
;


alter table task_dependencies
add constraint fk_task_dependencies_1
foreign key (task_id)
references tasks (task_id)
on delete restrict
;


alter table task_dependencies
add constraint fk_task_dependencies_2
foreign key (dependend_task_id)
references tasks (task_id)
on delete restrict
;