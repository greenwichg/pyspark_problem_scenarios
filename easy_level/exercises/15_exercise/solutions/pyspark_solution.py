from pyspark.sql import SparkSession
from pyspark.sql.functions import col, count, to_date
from pyspark.sql.types import StructType, StructField, IntegerType, StringType

def etl(taa_twitter_activity):
    
    # Parse tweet_date using the correct format and convert to DateType
    taa_twitter_activity = taa_twitter_activity.withColumn("tweet_date", F.to_date(col("tweet_date"), "MM/dd/yyyy HH:mm:ss"))

    filtered_df = taa_twitter_activity.filter(
        (col("tweet_date") >= "2022-01-01") & (col("tweet_date") <= "2022-12-31")
    )

    total_tweets = filtered_df.groupBy("user_id").agg(F.count("tweet_id").alias("tweet_bucket"))

    result = total_tweets.groupBy("tweet_bucket").agg(F.count("user_id").alias("users_count"))
  
    return result