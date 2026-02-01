from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W
import pyspark
import datetime
import json

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(mc_extraction, mc_mines):
    joined_df = mc_mines.join(
        mc_extraction, mc_mines.id == mc_extraction.mine_id
    )

    result_df = joined_df.groupby(
        ["location", "mineral"]
    ).agg(
        F.sum("quantity").alias("total_quantity")
    )

    result_df = result_df.orderBy(
        "location", "mineral"
    )

    return result_df
