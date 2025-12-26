create or replace function folders_list_folders(
    p_folder_id folder_tree.folder_id%type
)
returns table (
    folder_id folders.folder_id%type,
    name folders.name%type
)
language plpgsql
as $$
begin
    return query
    select
        b.folder_id,
        b.name
    from files.folder_tree a
        join files.folders b
            on a.folder_id = b.folder_id
    where
        a.folder_id = p_folder_id
    ;
end
$$;

comment on function folders_list_folders is 'list folders in folder';