from pyspark.sql.types import IntegerType
from pyspark.sql import SparkSession
from pyspark.streaming import StreamingContext
from pyspark.sql.functions import max,min
from pyspark.sql import *



spark = SparkSession.builder.appName("projeto").getOrCreate()


mylist = [1, 2, 3, 4]


spark.createDataFrame(mylist, IntegerType()).show()



# Subscribe to 1 topic, with headers
df = spark \
  .readStream \
  .format("kafka") \
  .option("kafka.bootstrap.servers", "localhost:9092") \
  .option("subscribe", "topico-projeto") \
  .option("includeHeaders", "true") \
  .load()
df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)", "headers")

df.show()

