create or replace procedure user_save(
    p_user_id users.id%type,
    p_first_name users.first_name%type,
    p_middle_nmae users.middle_name%type,
    p_last_name users.last_name%type,
    p_prefix users.prefix%type,
    p_suffix users.suffix%type,
    p_version users.version%type
)
language plpgsql
as $$
declare
    v_rows_affected int;
begin
    insert into users.users (
        id,
        first_name,
        middle_name,
        last_name,
        prefix,
        suffix
    ) values (
        p_user_id,
        p_first_name,
        p_middle_nmae,
        p_last_name,
        p_prefix,
        p_suffix
    )
    on conflict (id) do
    update set
        first_name = p_first_name,
        middle_name = p_middle_nmae,
        last_name = p_last_name,
        prefix = p_prefix,
        suffix = p_suffix
    where
        users.version = p_version
    ;

    get diagnostics v_rows_affected = ROW_COUNT;
    if v_rows_affected <> 1 then
        raise exception 'data has been modified by another session';
    end if;

end
$$;


comment on procedure user_save is 'save user details';
