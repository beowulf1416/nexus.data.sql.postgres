create or replace procedure source_remove(
    p_tenant_id sources.tenant_id%type,
    p_id sources.id%type
)
language plpgsql
as $$
begin
    delete
    from bi.sources
    where
        id = p_id
        and tenant_id = p_tenant_id
    ;
end
$$;

comment on procedure source_remove is 'remove data source';