create table registrations (
    id uuid not null,
    email common.email not null,
    token varchar(100) not null,
    verified boolean not null default false
);

alter table registrations
add constraint pk_registrations
primary key (id)
;