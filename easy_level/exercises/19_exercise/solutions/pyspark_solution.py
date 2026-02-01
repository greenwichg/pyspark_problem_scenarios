from pyspark.sql import SparkSession
from pyspark.sql.functions import sum, when, col

def etl(input_df):
    # Count views based on device type conditions using Spark SQL functions
    result_df = (
        input_df
        .agg(
            F.sum(F.when(col("device_type") == "laptop", 1).otherwise(0)).alias("laptop_views"),
            F.sum(F.when(col("device_type").isin(["tablet", "phone"]), 1).otherwise(0)).alias("mobile_views")
        )
    )
    
    return result_df
