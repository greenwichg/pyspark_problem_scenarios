from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W
import pyspark
import datetime
import json

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(calls_df, customers_df):
    # Join calls_df and customers_df on cust_id column
    joined_df = calls_df.join(customers_df, "cust_id")

    # Aggregate the joined DataFrame by date
    agg_df = joined_df.groupBy("date").agg(
        F.countDistinct("cust_id").alias("num_customers"),
        F.sum("duration").alias("total_duration")
    )

    # Sort the result by date in ascending order
    result_df = agg_df.orderBy("date")

    return result_df