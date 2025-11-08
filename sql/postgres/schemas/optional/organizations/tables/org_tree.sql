create table org_tree (
    org_id uuid not null,
    parent_org_id uuid not null,
    active bool not null,
    created_ts timestamp with time zone not null default (now() at time zone 'utc')
);


comment on table org_tree is 'organizational tree';


alter table org_tree
add constraint pk_org_tree
primary key (org_id, parent_org_id)
;


alter table org_tree
add constraint fk_org_tree_1
foreign key (org_id)
references organizations (org_id)
on delete restrict
;


alter table org_tree
add constraint fk_org_tree_2
foreign key (parent_org_id)
references organizations (org_id)
on delete restrict
;