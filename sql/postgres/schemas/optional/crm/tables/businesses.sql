create table businesses (
	business_id uuid not null,

	tenant_id uuid not null,
	active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),

    name varchar(100) not null,
    description text,

    constraint pk_businesses
    primary key (business_id),

    constraint u_businesses_1
    unique (name),

    constraint fk_businesses_1
    foreign key (tenant_id)
    references tenants.tenants (id)
    on delete restrict
);

comment on table businesses is 'table of business records';
