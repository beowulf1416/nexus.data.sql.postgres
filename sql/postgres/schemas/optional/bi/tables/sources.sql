create table sources (
    id uuid not null,
    active boolean not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    tenant_id uuid not null,
    name varchar(100) not null,
    cn text not null
);


alter table sources
add constraint pk_sources
primary key (id)
;


alter table sources
add constraint u_source_1
unique (tenant_id, name)
;


