#pip install PyHive
#pip install PyMySQL

import pymysql.cursors
from pyhive import hive
from TCLIService.ttypes import TOperationState

#Conectando no MySQL
connection = pymysql.connect(host='177.104.61.65',
                             user='fgv',
                             password='fgv',
                             database='stockfgv',
                             cursorclass=pymysql.cursors.DictCursor)


with connection:
    with connection.cursor() as cursor:
         # lendo registro
        sql = "SELECT * FROM `stocks` LIMIT %s"
        cursor.execute(sql,(2))
        result = cursor.fetchone()
        print(result)


#HIVE
cursor1 = hive.connect('localhost:10000').cursor1()
cursor1.execute('SELECT * FROM stocks', async=True)

status = cursor1.poll().operationState
while status in (TOperationState.INITIALIZED_STATE, TOperationState.RUNNING_STATE):
    logs = cursor1.fetch_logs()
    for message in logs:
        print message

    # If needed, an asynchronous query can be cancelled at any time with:
    # cursor.cancel()

    status = cursor1.poll().operationState

print cursor1.fetchall()