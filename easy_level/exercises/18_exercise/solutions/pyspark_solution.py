from pyspark.sql import SparkSession
from pyspark.sql.functions import month, avg, col

def etl(input_df):
    # Extract month from submit_date
    input_df = input_df.withColumn("mth", month(col("submit_date")))
    
    # Group by month and product_id, calculate average stars
    result_df = (
        input_df.groupBy("mth", "product_id")
        .agg(avg("stars").alias("avg_stars"))
        .withColumn("avg_stars", col("avg_stars").cast("double"))
    )
    
    # Rename columns for consistency
    result_df = result_df.withColumnRenamed("product_id", "product")
    
    # Sort by month and product
    result_df = result_df.orderBy("mth", "product")
    
    return result_df
