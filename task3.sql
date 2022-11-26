
create table item_prices(
	item_id numeric(21,0), item_name char(150), 
	item_price numeric(12, 2), created_dttm timestamp
);

insert into item_prices values (138, 'zybkemyahr', 420.55, '2022-10-29 16:37:17');
insert into item_prices values (138, 'zybkemyahr', 737.67, '2022-10-10 16:37:17');
insert into item_prices values (138, 'zybkemyahr', 263.24, '2022-11-23 16:37:17');
insert into item_prices values (478, 'efspjowziy', 277.03, '2022-10-20 16:37:17');
insert into item_prices values (478, 'efspjowziy', 484.38, '2022-09-27 16:37:17');
insert into item_prices values (478, 'efspjowziy', 945.94, '2022-11-16 16:37:17');
insert into item_prices values (860, 'jgfigutrjy', 310.95, '2022-10-23 16:37:17');
insert into item_prices values (860, 'jgfigutrjy', 478.58, '2022-10-18 16:37:17');
insert into item_prices values (860, 'jgfigutrjy', 355.02, '2022-11-19 16:37:17');

create table dict_item_prices as
with tmp_table as (
	select item_id, item_name, item_price, created_dttm::date as valid_from_dt, 
	(
		select min(closest_date.created_dttm::date - 1)
		from item_prices as closest_date
		where closest_date.created_dttm::date > item_prices.created_dttm::date
		and  item_prices.item_id = closest_date.item_id
	
	) as valid_to_dt from item_prices
)
select item_id, item_name, item_price, valid_from_dt, coalesce(valid_to_dt, '9999-12-31') as valid_to_dt from tmp_table






