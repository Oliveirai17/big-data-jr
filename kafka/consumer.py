from kafka import KafkaConsumer
from json import loads
from pyspark.sql import SparkSession
from pyspark.streaming import StreamingContext
from pyspark.sql.functions import max,min
from statistics import mean
from pyspark.sql import *
from kafka import KafkaProducer

#spark = SparkSession.builder.appName("projeto").getOrCreate()

list =[]

consumer = KafkaConsumer(
    'topico-projeto',
     bootstrap_servers=['localhost:9092'],
     #auto_offset_reset='earliest',
     enable_auto_commit=True,
     value_deserializer=lambda x: loads(x.decode('utf-8')))

# df = spark \
#   .readStream \
#   .format("kafka") \
#   .option("kafka.bootstrap.servers", "localhost:9092") \
#   .option("subscribe", "topico-projeto") \
#   .load()

# df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)", "headers")

# df.show()



 # spark = SparkSession \
    #     .builder \
    #     .appName("Python Spark SQL basic example") \
    #     .getOrCreate()


    # Subscribe to 1 topic, with headers
    # df = spark \
    #     .readStream \
    #     .format("kafka") \
    #     .option("kafka.bootstrap.servers", "broker:9092") \
    #     .option("subscribe", "kafka-python-topic") \
    #     .option("includeHeaders", "true") \
    #     .load()
        
    # df.selectExpr( "CAST(value AS STRING)")
    # df.show(3)


#spark-submit --packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.2.0 /usr/spark-2.4.0/code/process.py



producer = KafkaProducer(bootstrap_servers='localhost:9092',
                            value_serializer=lambda v: str(v).encode('utf-8'))

mensagem = 0

for msg in consumer:
    #print(msg)
    message = msg.value
    print(message, "\n")

    list.append(message)
    
    if (len(list) == 10): 
        avgVal = mean(list)
        print("Média: ",avgVal,"\n")
        if (avgVal >= 23):
            mensagem = 1
            producer.send('topico-devices', mensagem)
            #print ("MENSAGEM PARA O DEVICE: \nLIGA O AR CONDICIONADO\n")
        else:  
            mensagem = 0
            producer.send('topico-devices', mensagem)
             #print ("MENSAGEM PARA O DEVICE: \nDESLIGA O AR CONDICIONADO\n")   
        
        list.pop(0)