var df = spark.read.option("header", "true").option("inferSchema", "true").format("csv").load("/data/ABT.csv")

df.printSchema()
df.show(2)
df.head(2)

df.select("volume").show(2)
df.select($"volume").show(2)

df.filter("open < 92").show(3)

//importando bibliotecas
import org.apache.spark.sql.functions.{col, min, max}


var dfCloseOpen = df.withColumn("close/open", $"close"/$"open")
var dfCloseOpen = df.withColumn("close/open", col("close")/col("open") )
