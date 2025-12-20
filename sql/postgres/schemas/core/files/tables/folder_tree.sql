create table folder_tree (
    parent_folder_id uuid not null,
    folder_id uuid not null
);


comment on table folder_tree is 'folder hierarchy';


alter table folder_tree
add constraint pk_folder_tree
primary key (parent_folder_id, folder_id)
;


alter table folder_tree
add constraint fk_folder_tree_1
foreign key (parent_folder_id)
references folders (folder_id)
on delete restrict
;


alter table folder_tree
add constraint fk_folder_tree_2
foreign key (folder_id)
references folders (folder_id)
on delete restrict
;


