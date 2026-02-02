from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W
import pyspark
import datetime
import json

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(input_df):
    # Calculate total_profit as total_sales - cogs, rounded to 2 decimal places
    input_df = input_df.withColumn(
        'total_profit',
        F.round(F.col('total_sales') - F.col('cogs'), 2)
    )

    # Select the top 3 rows sorted by total_profit in descending order
    result = (
        input_df
        .orderBy(F.col('total_profit').desc())
        .select('drug', 'total_profit')
        .limit(3)
    )

    return result
