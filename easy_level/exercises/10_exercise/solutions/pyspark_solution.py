from pyspark.sql import SparkSession
from pyspark.sql import functions as F

spark = SparkSession.builder.appName('run-pyspark-code').getOrCreate()

def etl(df_experiments, df_materials):
    # Perform a full outer join on 'material_id'
    joined_df = df_experiments.join(
        df_materials, on="material_id", how="full"
    )

    # Select and reorder columns to match the expected output schema
    result_df = joined_df.select(
        "experiment_id",
        "material_id",
        "experiment_date",
        "experiment_results",
        "material_name",
        "material_type"
    )

    return result_df
