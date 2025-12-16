create table file_tags (
    file_id uuid not null,
    tag_id uuid not null
);


comment on table file_tags is 'association table between files and tags';


alter table file_tags
add constraint pk_file_tags
primary key (file_id, tag_id)
;