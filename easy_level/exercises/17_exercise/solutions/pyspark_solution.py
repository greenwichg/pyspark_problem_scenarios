from pyspark.sql import SparkSession
from pyspark.sql.functions import col

def etl(ia_parts):
    """
    Extracts components that have not been completed (completion_date is NULL).

    Parameters:
        ia_parts (DataFrame): Spark DataFrame containing parts information including 'component', 
                              'assembly_stage', and 'completion_date'.

    Returns:
        DataFrame: A Spark DataFrame with only components where completion_date is NULL.
    """
    # Step 1: Filter rows where 'completion_date' is NULL (equivalent to .isna() in Pandas)
    filtered_df = ia_parts.filter(col("completion_date").isNull())

    # Step 2: Select only the required columns
    result_df = filtered_df.select("component", "assembly_stage")

    return result_df
