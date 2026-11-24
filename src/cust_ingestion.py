from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

# Read CSV from Volume
df = (
    spark.read
    .option("header", "true")
    .option("inferSchema", "true")
    .csv("/Volumes/workspace/dev/srcfiles/Customer_Data.csv")
)

# Create / Replace Delta Table
(
    df.write
    .format("delta")
    .mode("overwrite")
    .saveAsTable("workspace.dev.cust_store")
)

print("Successfully created Delta table: workspace.dev.cust_store")