set schema 'employees';

insert into employment_types (id, name) values
(0, 'regular'),
(1, 'casual'),
(2, 'probationary'),
(3, 'contractual'),
(4, 'project')
;


insert into leave_types (id, name) values
(0, 'vacation'),
(1, 'sick')
;