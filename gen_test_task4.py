import random
import string
import datetime

a = ["138", "478", "860"]

for i in range(3):
    random_time = datetime.datetime.now().replace(microsecond=0) - datetime.timedelta(days=int(round(random.uniform(3, 10), 0)))
    cur_client_id = str(int(round(random.uniform(1, 3), 0)))
    
    print('insert into transaction_details values','(' + str(int(round(random.uniform(10, 1000), 0))) + ",", cur_client_id + "," ,a[i] + ",", str(int(round(random.uniform(1, 3), 0))) + ",", "'" + str(random_time - datetime.timedelta(days=int(round(random.uniform(15, 30), 0)))) + "');")
    print('insert into transaction_details values','(' + str(int(round(random.uniform(10, 1000), 0))) + ",", cur_client_id + "," ,a[i] + ",", str(int(round(random.uniform(1, 3), 0))) + ",", "'" + str(random_time - datetime.timedelta(days=int(round(random.uniform(30, 60), 0)))) + "');")
    print('insert into transaction_details values','(' + str(int(round(random.uniform(10, 1000), 0))) + ",", cur_client_id + "," ,a[i] + ",", str(int(round(random.uniform(1, 3), 0))) + ",", "'" + str(random_time) + "');")