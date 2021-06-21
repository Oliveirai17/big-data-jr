//Lendo o arquivo e atribuindo na variavel
var df = spark.read.option("header", "true").option("inferSchema", "true").format("csv").load("/data/covid_19_data.csv")

//importando bibliotecas
import org.apache.spark.sql.functions.{col, min, max, when, desc}
//import org.apache.spark.SparkContext
import org.apache.spark.sql.SQLContext

//visão temporaria e consulta usando SQL
val sqlContext = spark.sqlContext
df.createOrReplaceTempView("covid")
//val dft = sqlContext.sql("select * from covid where `Province/State` is null")


// criando outro DataFrame (sobrescrevendo ) o DataFrame anterior, alteramos a coluna 'Province/State' quando ela possuísse valor null para 'N/A', caso contrário, retornamos o valor já existente
df = df.withColumn( "Province/State", when ( col("Province/State").isNull, "N/A" ) .otherwise (df("Province/State")) )
// filtrando a coluna 'Province/State' para verificar se ainda possui valores nulos
//var df2 = df.na.fill("N/A", Array("Province/State"))

df.filter ( $"Province/State".isNull ).show(1)



//executa uma consulta SQL no dataframe (na verdade visão criada na linha acima)
var sql = sqlContext.sql("select * from covid where `ObservationDate` is null")

sql.show(5);

//preencher com valores 0 a coluna 'Deaths' quando houver valor null
//df.na.fill(0,subset=['Deaths']).show(2)
//val dft = sqlContext.sql("select * from covid where `Deaths` is null").show(5);
//Não tem valor null

//Ranking dos paises com mais mortes
var fdgp = df.groupBy("Country/Region").max()
fdgp.sort( desc("max(Deaths)") ).select($"Country/Region",$"max(Deaths)").show(5)


var dfCountry = df.groupBy("Country/Region").max()
print("Paises com mais confirmados")
dfCountry.sort( desc("max(Confirmed)") ).select($"Country/Region", $"max(Confirmed)").show(5)


// var df2 = df.na.fill("N/A", Array ("Deaths"))

