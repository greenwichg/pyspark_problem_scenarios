from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W
import pyspark
import datetime
import json

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(tms_pharma_in):
    # Group by manufacturer and calculate total sales
    grouped = tms_pharma_in.groupBy('manufacturer').agg(F.sum('total_sales').alias('total_sales'))

    # Round total sales to the nearest million and format as "$xx million"
    grouped = grouped.withColumn('sale', F.concat(F.lit('$'), F.round(grouped['total_sales'] / 1_000_000).cast('int').cast('string'), F.lit(' million')))

    # Sort by total sales descending and manufacturer name ascending
    result = grouped.orderBy(F.col('total_sales').desc(), F.col('manufacturer').asc())

    # Select only the required columns
    result = result.select('manufacturer', 'sale')

    return result