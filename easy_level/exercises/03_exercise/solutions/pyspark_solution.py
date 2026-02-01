from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(social_media):
    # Replace "Python" with "PySpark" in the text column
    new_social_media = social_media.withColumn(
        "text",
        F.regexp_replace(F.col("text"), "Python", "PySpark")
    )
    
    # Reorder the columns as per the output schema
    new_social_media = new_social_media.select(
        "comments", "date", "id", "likes", "platform", "shares", "text"
    )
    
    # Sort the DataFrame by the 'comments' column
    new_social_media = new_social_media.orderBy("comments")
    
    return new_social_media