from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W
import pyspark
import datetime
import json

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(input_df):
    # Extract the domain name from the email addresses
    email_domain = F.regexp_extract(
        F.col("email"), r"@(.+)", 1
    )
    input_df = input_df.withColumn(
        "email_domain", email_domain
    )

    # Anonymize the phone numbers by replacing the first six digits with asterisks
    anon_phone = F.regexp_replace(
        F.col("phone"), r"^\d{6}", "******"
    )
    input_df = input_df.withColumn(
        "anon_phone", anon_phone
    )

    output_df = input_df.select(
        anon_phone.alias("anon_phone"),
        email_domain.alias("email_domain"),
        F.col("user_id")
    )
    
    # Sort the output DataFrame by anon_phone
    output_df = output_df.orderBy("anon_phone")

    return output_df