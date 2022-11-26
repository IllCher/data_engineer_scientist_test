/*
create table task3(
	item_id numeric(21,0), item_name char(150), 
	item_price numeric(12, 2), created_dttm timestamp
);
insert into task3 values (130, 'lygvvufltx', 622.56, '2022-12-09 13:17:08');
insert into task3 values (130, 'lygvvufltx', 377.07, '2022-12-07 13:17:08');
insert into task3 values (130, 'lygvvufltx', 710.48, '2022-11-30 13:17:08');
insert into task3 values (62, 'duzzrplnih', 897.54, '2022-12-10 13:17:08');
insert into task3 values (62, 'duzzrplnih', 929.31, '2022-12-09 13:17:08');
insert into task3 values (62, 'duzzrplnih', 28.72, '2022-12-03 13:17:08');
insert into task3 values (214, 'nhxzhjtpul', 971.26, '2022-12-06 13:17:08');
insert into task3 values (214, 'nhxzhjtpul', 924.99, '2022-12-10 13:17:08');
insert into task3 values (214, 'nhxzhjtpul', 194.71, '2022-11-30 13:17:08');
*/

create table task3_result as
with tmp_table as (
	select item_id, item_name, item_price, created_dttm::date as valid_from_dt, 
	(
		select min(closest_date.created_dttm::date - 1)
		from task3 as closest_date
		where closest_date.created_dttm::date > task3.created_dttm::date
		and  task3.item_id = closest_date.item_id
	
	) as valid_to_dt from task3
)
select item_id, item_name, item_price, valid_from_dt, coalesce(valid_to_dt, '9999-12-31') as valid_to_dt from tmp_table






