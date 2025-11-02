create or replace function countries_fetch_all()
returns table (
    official_name_en countries.official_name_en%type,
    iso_3166_1_alpha_2 countries.iso_3166_1_alpha_2%type,
    iso_3166_1_alpha_3 countries.iso_3166_1_alpha_3%type,
    iso_3166_1_numeric countries.iso_3166_1_numeric%type,
    iso_4217_currency_alphabetic_code countries.iso_4217_currency_alphabetic_code%type,
    iso_4217_currency_country_name countries.iso_4217_currency_country_name%type,
    iso_4217_currency_minor_unit countries.iso_4217_currency_minor_unit%type,
    iso_4217_currency_name countries.iso_4217_currency_name%type,
    iso_4217_currency_numeric_code countries.iso_4217_currency_numeric_code%type
)
language plpgsql
as $$
begin
    return query
    select
        a.official_name_en,
        a.iso_3166_1_alpha_2,
        a.iso_3166_1_alpha_3,
        a.iso_3166_1_numeric,
        a.iso_4217_currency_alphabetic_code,
        a.iso_4217_currency_country_name,
        a.iso_4217_currency_minor_unit,
        a.iso_4217_currency_name,
        a.iso_4217_currency_numeric_code
    from common.countries a
    ;
end
$$;


comment on function countries_fetch_all is 'fetch all country records';