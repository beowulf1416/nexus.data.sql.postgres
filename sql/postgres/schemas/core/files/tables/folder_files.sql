create table folder_files (
    folder_id uuid not null,
    file_id uuid not null,
    created_ts timestamp with time zone not null default( now() at time zone 'utc')
);

comment on table folder_files is 'files in folder';


alter table folder_files
add constraint pk_folder_files
primary key (folder_id, file_id)
;


alter table folder_files
add constraint fk_folder_files_1
foreign key (folder_id)
references folders (folder_id)
on delete restrict
;


alter table folder_files
add constraint fk_folder_files_2
foreign key (file_id)
references files (file_id)
on delete restrict
;