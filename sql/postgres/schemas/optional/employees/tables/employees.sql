create table employees (
    tenant_id uuid not null,
    user_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default( now() at time zone 'utc'),
    employment_type_id smallint not null
);


comment on table employees is 'employees';


alter table employees
add constraint pk_employees
primary key (tenant_id, user_id)
;


alter table employees
add constraint fk_employees_1
foreign key (tenant_id)
references tenants.tenants (id)
on delete restrict
;


alter table employees
add constraint fk_employees_2
foreign key (user_id)
references users.users (id)
on delete restrict
;


alter table employees
add constraint fk_employees_3
foreign key (employment_type_id)
references employment_types (id)
on delete restrict
;