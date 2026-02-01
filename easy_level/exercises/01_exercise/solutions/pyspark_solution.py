from pyspark.sql import SparkSession
from pyspark.sql import functions as F
import datetime


spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()


def etl(video_stream_df):
   current_year = datetime.datetime.now().year
   filtered_df = video_stream_df.where(
       (F.col("view_count") > 1000000)
       & (
           F.col("release_year")
           >= current_year - 6
       )
   )


   output_df = filtered_df.select("duration", "genre", "release_year", "title", "video_id", "view_count")\
                       .orderBy("duration")
   return output_df