create table emails (
	tenant_id uuid not null,
	email_id uuid not null,
	partner_id uuid not null,

	active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),

    email common.email not null,

    constraint pk_emails
    primary key (email_id),

    constraint u_emails_1
    unique (tenant_id, email),

    constraint fk_emails_1
    foreign key (tenant_id)
    references tenants.tenants (tenant_id)
    on delete restrict,

    constraint fk_emails_2
    foreign key (partner_id)
    references partners (partner_id)
    on delete restrict
);
