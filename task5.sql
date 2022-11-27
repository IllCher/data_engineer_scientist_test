drop table if exists posts;

create table posts(
	id numeric(21,0), created_at timestamp, 
	title char(150)
);
insert into posts values (1, '2022-01-17 08:50:58', 'Sberbank is the best bank');
insert into posts values (2, '2022-01-17 18:36:41', 'Visa vs Mastercard');
insert into posts values (3, '2022-01-17 16:16:17', 'Visa vs UnionPay');
insert into posts values (4, '2022-01-17 18:01:00', 'Mastercard vs UnionPay');

insert into posts values (5, '2022-02-17 18:01:00', 'Mastercard vs UnionPay');
insert into posts values (6, '2022-02-16 16:44:36', 'Hadoop or Greenplum: pros and cons');
insert into posts values (7, '2022-02-16 14:57:32', 'NFC: wireless payment');
insert into posts values (8, '2022-02-16 14:57:32', 'NFC: wireless payment');
insert into posts values (9, '2022-02-16 14:57:32', 'NFC: wireless payment');
insert into posts values (10, '2022-02-16 14:57:32', 'NFC: wireless payment');
insert into posts values (11, '2022-02-16 14:57:32', 'NFC: wireless payment');

insert into posts values (12, '2022-03-17 16:16:17', 'Visa vs UnionPay');
insert into posts values (13, '2022-03-17 18:01:00', 'Mastercard vs UnionPay');

create table results as
with mnth_dt_cnt as (
	select 
		DATE_TRUNC('month', created_at) as dt, 
		count(id)::numeric(3,2) as count
	from posts
	group by DATE_TRUNC('month', created_at)
	order by DATE_TRUNC('month', created_at)
), with_prev_mnth_cnt as (
	select  
		dt, count, lag(count, 1) over (order by dt) prev_mnth_cnt
	from mnth_dt_cnt
)

select dt::date, count::int,
	case
		when (count / prev_mnth_cnt) is null
		then null
		else concat('', to_char(round(100 * ((count) / (prev_mnth_cnt) - 1), 1), '99D9'), '%')
		end prcnt_growth
	from with_prev_mnth_cnt