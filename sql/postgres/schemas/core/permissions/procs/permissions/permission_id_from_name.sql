create or replace function permission_id_from_name(
    p_name permissions.name%type
)
returns permissions.id%type
language plpgsql
as $$
declare
    t_permission_id permissions.id%type;
begin
    select
        a.id into t_permission_id
    from permissions.permissions a
    where
        a.name = p_name
    ;

    return t_permission_id;

exception
    when no_data_found then
        return 0;
end
$$;


comment on function permission_id_from_name is 'fetch permission id from name';