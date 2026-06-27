create table people (
	people_id uuid not null,

	tenant_id uuid not null,
	active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),

    first_name varchar(100),
    middle_name varchar(100),
    last_name varchar(100),
    prefix varchar(100),
    suffix varchar(100),

    constraint pk_people
    primary key (people_id),

    constraint fk_people_1
    foreign key (tenant_id)
    references tenants.tenants (id)
    on delete restrict,

    constraint chk_people_1
    check ( concat(first_name, middle_name, last_name) is null )
);

comment on table people is 'table of people records';
