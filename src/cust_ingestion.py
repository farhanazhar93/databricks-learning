import argparse
from pyspark.sql import SparkSession

parser = argparse.ArgumentParser()

parser.add_argument("--catalog", required=True)
parser.add_argument("--schema", required=True)

args = parser.parse_args()

catalog = args.catalog
schema = args.schema

spark = SparkSession.builder.getOrCreate()

df = (
    spark.read
    .option("header", "true")
    .option("inferSchema", "true")
    .csv(f"/Volumes/{catalog}/landingfiles/srcfiles/Customer_Data.csv")
)

(
    df.write
    .format("delta")
    .mode("overwrite")
    .saveAsTable(f"{catalog}.{schema}.cust_store")
)

print(f"Successfully created Delta table: {catalog}.{schema}.cust_store")