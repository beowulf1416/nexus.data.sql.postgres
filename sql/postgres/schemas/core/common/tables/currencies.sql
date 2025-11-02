create table currencies (
    id int not null,
    currency varchar(10) not null,
    unit_text varchar(100) not null,
    symbol varchar(5)
);


comment on table currencies is 'currencies';


alter table currencies
add constraint pk_currencies
primary key (id)
;


alter table currencies
add constraint u_currencies_1
unique (unit_text)
;