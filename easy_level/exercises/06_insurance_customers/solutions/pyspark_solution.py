from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W
import pyspark
import datetime
import json

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(ic_data_1, ic_data_2):
    combined_df = ic_data_1.unionAll(ic_data_2)
    output_df = combined_df.orderBy('age')
    return output_df
