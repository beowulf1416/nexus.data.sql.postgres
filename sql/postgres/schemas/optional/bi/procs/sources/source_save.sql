create or replace procedure source_save(
    p_tenant_id sources.tenant_id%type,
    p_id sources.id%type,
    p_name sources.name%type,
    p_cn sources.cn%type
)
language plpgsql
as $$
begin
    insert into bi.sources (
        id, 
        active,
        tenant_id,
        name,
        cn
    ) values (
        p_id,
        true,
        p_tenant_id,
        p_name,
        p_cn
    )
    on conflict (id)
    update set
        cn = p_cn
    where
        id = p_cn
        and tenant_id = p_tenant_id
    ;
end
$$;

comment on procedure source_save is 'save data source settings';