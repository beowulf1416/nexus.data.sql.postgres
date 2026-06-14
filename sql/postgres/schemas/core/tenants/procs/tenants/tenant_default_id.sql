create or replace function tenant_default_id()
returns uuid
language plpgsql
as $$
begin
    return uuid_nil();
end;
$$;
