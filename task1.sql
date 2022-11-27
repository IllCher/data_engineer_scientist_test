drop table if exists test;

create table test(id integer, name char(10), age integer);

insert into test values (1, 'Вася', 23);
insert into test values (2, 'Петя', 40);
insert into test values (3, 'Маша', 19);
insert into test values (4, 'Марина', 23);
insert into test values (5, 'Сергей', 34);

select name, age from test order by age limit 3;


select name, age
from (
	select name, age,
		dense_rank() over (order by age) as rank
	from test
) tmp
where rank <= 2;


select name, age
from (
	select name, age,
		rank() over (order by age) as rank
	from test
) tmp
where rank <= 2;


select name, age
from (
	select name, age,
		row_number() over (order by age) as row_nmb
	from test
) tmp
where row_nmb <= 3;

select name, age from test order by age fetch first 3 row only;