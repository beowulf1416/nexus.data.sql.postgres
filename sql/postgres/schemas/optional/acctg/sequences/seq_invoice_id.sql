create sequence seq_invoice_id
    start with 1
    increment by 1
    no maxvalue
    no minvalue
    cache 1
;

comment on sequence seq_invoice_id is 'sequence for the invoice_id_seq field, resets every day';
