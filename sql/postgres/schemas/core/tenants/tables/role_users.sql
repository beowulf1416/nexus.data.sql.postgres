create table role_users (
    role_id uuid not null,
    user_id uuid not null,
    active boolean not null default false,
    created_ts timestamp with time zone not null default (now() at time zone 'utc')
);


comment on table role_users is 'role assignments';


alter table role_users
add constraint pk_role_users
primary key (role_id, user_id)
;


alter table role_users
add constraint fk_role_users_1
foreign key (role_id)
references roles (role_id)
on delete restrict
;


alter table role_users
add constraint fk_role_users_2
foreign key (user_id)
references users.users (id)
on delete restrict
;