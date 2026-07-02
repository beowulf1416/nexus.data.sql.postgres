create table addresses (
	tenant_id uuid not null,
	address_id uuid not null,
	partner_id uuid not null,

	active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),

    country_id int not null,
    state varchar(100),
    city varchar(100),
    address_line_1 varchar(255),
    address_line_2 varchar(255),
    postal_code varchar(20),

    constraint pk_addresses
    primary key (address_id),

    constraint fk_addresses_1
    foreign key (tenant_id)
    references tenants.tenants (tenant_id)
    on delete restrict,

    constraint fk_addresses_2
    foreign key (partner_id)
    references partners (partner_id)
    on delete restrict,

    constraint fk_addresses_3
    foreign key (country_id)
    references common.countries (iso_3166_1_numeric)
    on delete restrict
);
