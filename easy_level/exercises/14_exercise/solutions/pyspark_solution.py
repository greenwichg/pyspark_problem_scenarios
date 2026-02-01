from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark.sql import Window as W
import pyspark
import datetime
import json

# Initialize Spark Session
spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(csm_candidate_skills):
    # Filter candidates with required skills
    filtered_df = csm_candidate_skills.filter(
        F.col("skill").isin("Python", "Tableau", "PostgreSQL")
    )
    
    # Count the number of required skills for each candidate
    grouped_df = filtered_df.groupBy("candidate_id").agg(
        F.count("skill").alias("skill_count")
    )
    
    # Filter candidates with all three skills
    result_df = grouped_df.filter(F.col("skill_count") == 3).select("candidate_id")
    
    # Sort the result by candidate_id
    result_df = result_df.orderBy("candidate_id")
    
    return result_df