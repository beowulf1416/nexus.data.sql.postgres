create table genders(
    gender_id smallint not null,
    name varchar(50) not null
);

comment on table genders is 'genders';


alter table genders
add constraint pk_genders
primary key (gender_id)
;


alter table genders
add constraint u_genders_1
unique (name)
;
