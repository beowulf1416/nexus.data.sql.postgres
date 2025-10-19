create table user_auth_types (
    user_id uuid not null,
    auth_type_id smallint not null
);

alter table user_auth_types
add constraint pk_user_auth_types
primary key (user_id)
;

alter table user_auth_types
add constraint fk_user_auth_types_1
foreign key (auth_type_id) references auth.auth_types(id)
on delete restrict
;

alter table user_auth_types
add constraint fk_user_auth_types_2
foreign key (user_id) references users.users(id)
on delete restrict
;