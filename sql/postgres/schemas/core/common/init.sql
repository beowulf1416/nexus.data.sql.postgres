set schema 'common';


insert into genders (id, name) values
(0, ''),
(1, 'male'),
(2, 'female')
;


insert into dimensions(id, name) values
(1, 'length'),
(2, 'area'),
(3, 'volume'),
(4, 'weight')
;




-- https://www.postgresql.org/docs/12/app-psql.html
-- countries
\copy countries (official_name_en,iso_3166_1_alpha_2,iso_3166_1_alpha_3,iso_3166_1_numeric,iso_4217_currency_alphabetic_code,iso_4217_currency_country_name,iso_4217_currency_minor_unit,iso_4217_currency_name,iso_4217_currency_numeric_code) from '/docker-entrypoint-initdb.d/csv/countries.csv' with delimiter ',' csv header quote '"'



-- currencies
-- temporarily create sequence to add records to currencies table
create sequence if not exists seq_currency as int
;

alter table if exists common.currencies
alter column id set default nextval('seq_currency')
;

\copy currencies (currency, unit_text, symbol) from '/docker-entrypoint-initdb.d/csv/currencies.csv' with delimiter ',' csv header quote '"'; 

alter table if exists currencies
alter column id drop default
;

drop sequence seq_currency
;