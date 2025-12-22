create or replace procedure folder_add(
    p_tenant_id folders.tenant_id%type,
    p_folder_id folders.folder_id%type,
    p_name folders.name%type
)
language plpgsql
as $$
begin
    insert into files.folders (
        tenant_id,
        folder_id,
        active,
        name
    ) values (
        p_tenant_id,
        p_folder_id,
        true,
        p_name
    );
end
$$;

comment on procedure folder_add is 'add folder';
