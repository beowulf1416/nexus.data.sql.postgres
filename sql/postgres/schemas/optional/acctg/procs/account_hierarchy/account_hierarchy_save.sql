create or replace procedure account_hierarchy_save(
    p_tenant_id accounts.tenant_id%type,
    p_account_id accounts.account_id%type,
    p_parent_account_id accounts.account_id%type
)
language plpgsql
as $$
begin
    insert into acctg.account_hierarchy (
        tenant_id,
        account_id,
        parent_account_id
    )
    values (
        p_tenant_id,
        p_account_id,
        p_parent_account_id
    )
    on conflict (account_id, parent_account_id) do
    update set
        parent_account_id = p_parent_account_id
    ;
end;
$$;

comment on procedure account_hierarchy_save is 'Saves an account hierarchy record, updating if it already exists.';
