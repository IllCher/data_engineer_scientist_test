/*create table task2(
	abonent char(10), region_id integer, dttm timestamp
);
insert into task2 values ('7072110988', 32722, '2021-08-18 13:15');
insert into task2 values ('7072110988', 32722, '2021-08-18 14:00');
insert into task2 values ('7072110988', 21534, '2021-08-18 14:15');
insert into task2 values ('7072110988', 32722, '2021-08-19 09:00');
insert into task2 values ('7071107101', 12533, '2021-08-19 09:15');
insert into task2 values ('7071107101', 32722, '2021-08-19 09:27');
*/

select *
from (select abonent, region_id, max(dttm) as dttm from task2
group by abonent, region_id
) as foo







