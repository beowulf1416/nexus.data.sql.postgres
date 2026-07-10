create or replace procedure account_save(
    p_tenant_id accounts.tenant_id%type,
    p_account_id accounts.account_id%type,
    p_account_type_id smallint,
    p_account_category_id smallint,
    p_code varchar(30),
    p_name varchar(100),
    p_description varchar(300)
)
language plpgsql
as $$
begin
    insert into acctg.accounts (
        tenant_id,
        account_id,
        account_type_id,
        account_category_id,
        code,
        name,
        description
    )
    values (
        p_tenant_id,
        p_account_id,
        p_account_type_id,
        p_account_category_id,
        p_code,
        p_name,
        p_description
    )
    on conflict (account_id)
    do update set
        account_type_id = p_account_type_id,
        account_category_id = p_account_category_id,
        code = p_code,
        name = p_name,
        description = p_description
    ;
end;
$$;

comment on procedure account_save is 'Saves an account, inserting or updating as necessary.';
