drop table if exists test;

create table test(id integer, name char(10), age integer)

insert into test values (1, 'Вася', 23);
insert into test values (2, 'Петя', 40);
insert into test values (3, 'Маша', 19);
insert into test values (4, 'Марина', 23);
insert into test values (5, 'Сергей', 34);

select name, age from test order by age limit 3;