create table leaves (
    tenant_id uuid not null,
    leave_id uuid not null,
    employee_id uuid not null,
    leave_type_id smallint not null,
    active bool not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    start_dt timestamp with time zone not null default (now() at time zone 'utc'),
    end_dt timestamp with time zone not null default (now() at time zone 'utc')
);


comment on table leaves is 'employee leaves';


alter table leaves
add constraint pk_leaves
primary key (leave_id)
;


alter table leaves
add constraint u_leaves
unique (tenant_id, employee_id, leave_id)
;


alter table leaves
add constraint fk_leaves_1
foreign key (tenant_id)
references tenants.tenants (id)
on delete restrict
;


alter table leaves
add constraint fk_leaves_2
foreign key (employee_id)
references employees (user_id)
on delete restrict
;


alter table leaves
add constraint fk_leaves_3
foreign key (leave_type_Id)
references leave_types (id)
on delete restrict
;


alter table leaves
add constraint chk_leaves_1
check (
    end_dt >= start_dt
);
