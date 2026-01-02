create or replace procedure source_set_active(
    p_id sources.id%type,
    p_active sources.active%type
)
language plpgsql
as $$
begin
    update bi.sources set
        active = p_active
    where
        id = p_id
    ;
end
$$;


comment on procedure source_set_active is 'set data source setting record active';