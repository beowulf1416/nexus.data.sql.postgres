create table org_tree (
    tenant_id uuid not null,
    org_id uuid not null,
    parent_org_id uuid not null,
    active bool not null default true,
    created_ts timestamp with time zone not null default (now() at time zone 'utc'),

    constraint pk_org_tree
    primary key (org_id),

    constraint u_org_tree_1
    unique (org_id, parent_org_id),

    constraint fk_org_tree_1
    foreign key (tenant_id)
    references tenants.tenants (tenant_id),

    constraint fk_org_tree_2
    foreign key (org_id)
    references organizations (org_id)
    on delete restrict,

    constraint fk_org_tree_3
    foreign key (parent_org_id)
    references organizations (org_id)
    on delete restrict
);


comment on table org_tree is 'organizational tree';
