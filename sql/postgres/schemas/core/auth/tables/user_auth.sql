create table user_auth (
    user_id uuid not null,
    auth_type_id smallint not null
);

alter table user_auth
add constraint pk_user_auth
primary key (user_id)
;

alter table user_auth
add constraint u_user_auth_1
unique (user_id, auth_type_id)
;

alter table user_auth
add constraint fk_user_auth_1
foreign key (auth_type_id) references auth.auth_types(id)
on delete restrict
;

alter table user_auth
add constraint fk_user_auth_2
foreign key (user_id) references users.users(id)
on delete restrict
;