import random
import string
import datetime

x = random.random()
# Random float number
for i in range(10):
    letters = string.ascii_lowercase
    result_str = ''.join(random.choice(letters) for i in range(10))
    random_time = datetime.datetime.now() + datetime.timedelta(days=int(round(random.uniform(1, 5), 0)))
    print(int(round(random.uniform(10, 1000), 0)), result_str, round(random.uniform(10.25, 1000.45), 2), random_time)