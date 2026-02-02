from pyspark.sql import SparkSession
from pyspark.sql import functions as F

# Initialize Spark session
spark = SparkSession.builder.appName('run-pyspark').getOrCreate()

def etl(input_df):
    # Calculate total items and total orders
    spark = SparkSession.builder.appName('run-pyspark').getOrCreate()
    total_items = input_df.withColumn('total_items', F.col('item_count') * F.col('order_occurrences')).agg(F.sum('total_items')).collect()[0][0]
    total_orders = input_df.agg(F.sum('order_occurrences')).collect()[0][0]

    # Calculate the mean and round to 1 decimal place
    mean = round(total_items / total_orders, 1)

    # Return the result as a Spark DataFrame
    result = spark.createDataFrame([{'mean': mean}])

    return result

# Usage example:
# result = etl(input_df)
# result.show()
