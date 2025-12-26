create or replace function folder_list_files(
    p_folder_id folder_files.folder_id%type
)
returns table (
    file_id folder_files.file_id%type,
    name files.name%type
)
language plpgsql
as $$
begin
    return query
    select
        b.file_id,
        b.name
    from files.folder_files a
        join files.files b
            on a.file_id = b.file_id
    where
        a.folder_id = p_folder_id
    ;
end
$$;

comment on function folder_list_files is 'list files in folder';