create table countries (
    official_name_en varchar(100) not null,
    iso_3166_1_alpha_2 char(2) not null,
    iso_3166_1_alpha_3 char(3) not null,
    iso_3166_1_numeric int not null,
    iso_4217_currency_alphabetic_code varchar(100),
    iso_4217_currency_country_name varchar(100),
    iso_4217_currency_minor_unit varchar(10),
    iso_4217_currency_name varchar(100),
    iso_4217_currency_numeric_code int
);


comment on table countries is 'countries';


alter table countries
add constraint pk_countries
primary key (iso_3166_1_numeric)
;


alter table countries
add constraint u_countries_1
unique (iso_3166_1_alpha_2)
;


alter table countries
add constraint u_countries_2
unique (iso_3166_1_alpha_3)
;


alter table countries
add constraint u_countries_3
unique (official_name_en)
;