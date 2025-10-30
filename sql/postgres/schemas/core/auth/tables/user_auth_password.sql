create table user_auth_password (
    user_id uuid not null,
    active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),
    email common.email not null,
    pw text not null
);


alter table user_auth_password
add constraint pk_users
primary key (user_id)
;

alter table user_auth_password
add constraint fk_user_auth_password_1
foreign key (user_id) references users.users(id)
on delete restrict
;