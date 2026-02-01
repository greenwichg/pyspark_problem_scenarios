from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W
import pyspark
import datetime
import json

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(df_pressure, df_temperature):
    # Join the DataFrames on ExperimentID
    df_joined = df_temperature.join(
        df_pressure,
        on="ExperimentID",
        how="inner",
    )

    # Calculate Result using the Ideal Gas Law
    df_result = df_joined.withColumn(
        "Result",
        F.col("Temperature") * F.col("Pressure"),
    )

    # Select only the required columns and sort the DataFrame
    df_result = df_result.select(
        "ExperimentID", "Result"
    ).sort("ExperimentID")

    return df_result