create or replace procedure user_save(
    p_user_id users.id%type,
    p_first_name users.first_name%type,
    p_middle_nmae users.middle_name%type,
    p_last_name users.last_name%type,
    p_prefix users.prefix%type,
    p_suffix users.suffix%type
)
language plpgsql
as $$
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
    ;
end
$$;


comment on procedure user_save is 'save user details';