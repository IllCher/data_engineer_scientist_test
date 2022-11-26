import random
import string
import datetime

for i in range(3):
    letters = string.ascii_lowercase
    result_str = ''.join(random.choice(letters) for i in range(10))
    random_time = datetime.datetime.now().replace(microsecond=0) - datetime.timedelta(days=int(round(random.uniform(3, 10), 0)))
    cur_item_id = int(round(random.uniform(10, 1000), 0)) 
    print('insert into item_prices values','(' + str(cur_item_id) + ",", "'" + str(result_str) + "'" + ",", str(round(random.uniform(10.25, 1000.45), 2)) + ",", "'" + str(random_time - datetime.timedelta(days=int(round(random.uniform(15, 30), 0)))) + "');")
    print('insert into item_prices values','(' + str(cur_item_id) + ",", "'" + str(result_str) + "'" + ",", str(round(random.uniform(10.25, 1000.45), 2)) + ",", "'" + str(random_time - datetime.timedelta(days=int(round(random.uniform(30, 60), 0)))) + "');")
    print('insert into item_prices values','(' + str(cur_item_id) + ",", "'" + str(result_str) + "'" + ",", str(round(random.uniform(10.25, 1000.45), 2)) + ",", "'" + str(random_time) + "');")