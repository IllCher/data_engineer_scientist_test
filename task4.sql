
drop table transaction_details;
create table transaction_details(
	transaction_id numeric(21,0), customer_id numeric(21,0), 
	item_id numeric(21, 0), item_number numeric(8,0), transaction_dttm timestamp
);
insert into transaction_details values (218, 2, 138, 2, '2022-10-25 16:40:10');
insert into transaction_details values (305, 2, 138, 2, '2022-10-02 16:40:10');
insert into transaction_details values (240, 2, 138, 2, '2022-11-21 16:40:10');
insert into transaction_details values (969, 2, 478, 1, '2022-10-25 16:40:10');
insert into transaction_details values (625, 2, 478, 2, '2022-09-26 16:40:10');
insert into transaction_details values (604, 2, 478, 3, '2022-11-18 16:40:10');
insert into transaction_details values (919, 2, 860, 3, '2022-10-26 16:40:10');
insert into transaction_details values (160, 2, 860, 2, '2022-10-15 16:40:10');
insert into transaction_details values (961, 2, 860, 3, '2022-11-19 16:40:10');
insert into transaction_details values (625, 3, 478, 2, '2022-09-26 16:40:10');
insert into transaction_details values (604, 3, 478, 3, '2022-11-18 16:40:10');
insert into transaction_details values (919, 4, 860, 3, '2022-10-26 16:40:10');
insert into transaction_details values (160, 5, 860, 2, '2022-10-15 16:40:10');
insert into transaction_details values (961, 6, 860, 3, '2022-11-19 16:40:10');

with table_with_item_id as 
(

with tmp_table as (
select 
transaction_id, item_number, customer_id, transaction_details.item_id, item_price, 
transaction_dttm::date, valid_from_dt, valid_to_dt
from transaction_details 
join dict_item_prices 
on transaction_details.item_id = dict_item_prices.item_id
where transaction_details.transaction_dttm::date < dict_item_prices.valid_to_dt 
and transaction_details.transaction_dttm::date > dict_item_prices.valid_from_dt and
	transaction_details.transaction_dttm::date - CURRENT_DATE < 30
)


select tmp.customer_id,tmp2.item_id,sum(tmp.sum_by_items)
	from 
		(select customer_id, item_id, sum(item_number * item_price) as sum_by_items from tmp_table
			group by customer_id, item_id) as tmp
	join
	(
	select tmp3.customer_id,max(tmp3.item_id) as item_id from
	(
	select tmp.customer_id,tmp.item_id from 
		(select customer_id, item_id, sum(item_number * item_price) as sum_by_items from tmp_table
			group by customer_id, item_id) as tmp
	join( 
		select tmp.customer_id, max(tmp.sum_by_items) as mv from
				(select customer_id, item_id, sum(item_number * item_price) as sum_by_items from tmp_table
				group by customer_id, item_id) as tmp
		group by customer_id
		) as t2 on t2.customer_id = tmp.customer_id and tmp.sum_by_items = t2.mv
		) as tmp3 group by tmp3.customer_id
	) as tmp2 on tmp.customer_id = tmp2.customer_id

	group by  tmp.customer_id,tmp2.item_id
)

select distinct customer_id, dict_item_prices.item_name as top_item_lm, sum as amount_spent_lm from table_with_item_id
join dict_item_prices on  table_with_item_id.item_id = dict_item_prices.item_id