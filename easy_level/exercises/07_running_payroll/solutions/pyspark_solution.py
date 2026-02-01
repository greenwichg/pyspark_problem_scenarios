from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W
import pyspark
import datetime
import json

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(rp_employees, rp_payroll):
    # Join the two DataFrames on employee_id
    joined_df = rp_employees.join(
        rp_payroll, on="employee_id", how="inner"
    )

    # Calculate the pay for each employee
    pay_col = F.when(
        joined_df.hours_worked <= 40,
        joined_df.hours_worked
        * joined_df.hourly_rate,
    ).otherwise(
        (40 * joined_df.hourly_rate)
        + (
            (joined_df.hours_worked - 40)
            * joined_df.hourly_rate
            * 1.5
        )
    )

    # Add the pay column to the DataFrame
    result_df = joined_df.withColumn(
        "pay", pay_col
    ).drop("hours_worked", "hourly_rate", "age")

    return result_df
