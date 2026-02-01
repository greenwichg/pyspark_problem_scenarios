from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W
import pyspark
import datetime
import json

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(df_planet, df_star):
    df_result = df_star.join(
        df_planet, df_star.id == df_planet.star_id
    ).select(
        df_star.name.alias("star_name"),
        df_star.color.alias("star_color"),
        df_star.type.alias("star_type"),
        df_planet.name.alias("planet_name"),
        df_planet.type.alias("planet_type"),
        df_star.distance.alias(
            "distance_star_earth"
        ),
        df_planet.distance.alias(
            "distance_planet_star"
        ),
    )

    return df_result
