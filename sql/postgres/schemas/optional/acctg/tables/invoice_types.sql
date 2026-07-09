create table invoice_types (
  invoice_type_id smallint,
  name varchar(100) not null,

  constraint pk_invoice_types
  primary key (invoice_type_id),

  constraint u_invoice_types_1
  unique (name)
);

comment on table invoice_types is 'table of invoice types';
