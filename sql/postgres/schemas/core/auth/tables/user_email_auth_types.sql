create table user_email_auth_types (
    user_id uuid not null,
    email common.email not null,
    pw text not null
);


alter table user_email_auth_types
add constraint pk_users
primary key (user_id)
;

alter table user_email_auth_types
add constraint fk_user_email_auth_types_1
foreign key (user_id) references users.users(id)
on delete restrict
;