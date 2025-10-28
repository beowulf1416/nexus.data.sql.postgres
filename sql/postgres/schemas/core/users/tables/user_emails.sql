create table user_emails (
    user_id uuid not null,
    active boolean not null default false,
    created_ts timestamp not null default now(),
    email common.email not null,
    verified boolean not null default false
);


alter table user_emails
add constraint pk_user_emails
primary key (user_id)
;


alter table user_emails
add constraint u_user_emails_1
unique (email)
;


alter table user_emails
add constraint fk_user_emails_1
foreign key (user_id)
references users (id)
on delete restrict
;