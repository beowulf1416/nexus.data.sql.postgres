create table task_timelines (
    task_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    projected_start timestamp with time zone,
    projected_end timestamp with time zone,
    actual_start timestamp with time zone,
    actual_end timestamp with time zone
);


comment on table task_timelines is 'task timelines';


alter table task_timelines
add constraint pk_task_timelines
primary key (task_id)
;

alter table task_timelines
add constraint fk_task_timelines_1
foreign key (task_id)
references tasks (task_id)
on delete restrict
;

alter table task_timelines
add constraint chk_task_timelines_1
check (
    projected_end >= projected_start
)
;

alter table task_timelines
add constraint chk_task_timelines_2
check (
    actual_end >= actual_start
)
;