from kafka import KafkaConsumer
from json import loads
from pyspark.sql import SparkSession
from pyspark.streaming import StreamingContext
from pyspark.sql.functions import max,min
from statistics import mean
from pyspark.sql import *
from kafka import KafkaProducer


spark = SparkSession.builder.appName("projeto").getOrCreate()

consumer = KafkaConsumer(
    'topico-devices',
     bootstrap_servers=['localhost:9092'],
     #auto_offset_reset='earliest',
     enable_auto_commit=True,
     value_deserializer=lambda x: loads(x.decode('utf-8')))

for msg in consumer:
    #print(msg)
    message = msg.value
    #print(message)

    if (message == 0):
        print ("Ar condicionado DESLIGADO")
    else:
        print ("Ar condicionado LIGADO") 
        

