from pyspark.sql import SparkSession
from pyspark.sql import functions as F
import datetime

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(adtc_customer):
    # Step 1: Transform - Aggregate downloads by date and user_type
    agg_df = (
        adtc_customer
        .groupBy("cdate", "user_type")
        .agg(F.sum("downloads").alias("total_downloads"))
    )

    # Step 2: Pivot to bring free and premium into columns
    pivot_df = (
        agg_df
        .groupBy("cdate")
        .pivot("user_type", ["free", "premium"])
        .sum("total_downloads")
        .withColumnRenamed("free", "non_paying_downloads")
        .withColumnRenamed("premium", "paying_downloads")
    )

    # Step 3: Filter where non-paying > paying
    result_df = (
        pivot_df
        .filter(F.col("non_paying_downloads") > F.col("paying_downloads"))
        .select("cdate", "non_paying_downloads", "paying_downloads")
        .orderBy("cdate")
    )

    return result_df
