create table business_people (
	business_id uuid not null,
	people_id uuid not null,

	active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),

    constraint pk_business_people
    primary key (business_id, people_id),

    constraint fk_business_people_1
    foreign key (business_id)
    references businesses (business_id)
    on delete restrict,

    constraint fk_business_people_2
    foreign key (people_id)
    references people (people_id)
    on delete restrict
);

comment on table business_people is 'businesses and people mapping';
