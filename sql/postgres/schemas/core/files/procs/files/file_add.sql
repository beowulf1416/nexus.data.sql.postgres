create or replace procedure file_add(
    p_tenant_id files.tenant_id%type,
    p_file_id files.file_add%type,
    p_folder_id files.folder_id%type,
    p_name files.name%type
)
language plpgsql
as $$
begin
    insert into files.files (
        tenant_id,
        file_id
    ) values (
        p_tenant_id,
        p_file_id
    );

    insert into files.folder_files (
        folder_id,
        file_id
    ) values (
        p_folder_id,
        p_file_id
    );
end
$$;


comment on procedure file_add is 'add file';