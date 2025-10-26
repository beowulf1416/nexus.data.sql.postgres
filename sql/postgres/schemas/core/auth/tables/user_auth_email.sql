create table user_auth_email (
    user_id uuid not null,
    email common.email not null,
    pw text not null
);


alter table user_auth_email
add constraint pk_users
primary key (user_id)
;

alter table user_auth_email
add constraint fk_user_auth_email_1
foreign key (user_id) references users.users(id)
on delete restrict
;