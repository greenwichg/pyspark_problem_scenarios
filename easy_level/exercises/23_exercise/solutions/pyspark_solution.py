from pyspark.sql import SparkSession
from pyspark.sql.functions import col, count

def etl(tr_trades, tr_users):
    """
    Extracts the top 3 cities with the highest number of completed trades.

    Parameters:
        tr_trades (DataFrame): Spark DataFrame with user_id and status.
        tr_users (DataFrame): Spark DataFrame with user_id and city.

    Returns:
        DataFrame: A Spark DataFrame containing the top 3 cities with the most completed trades.
    """
    # Step 1: Filter only 'Completed' trades
    completed_trades = tr_trades.filter(col("status") == "Completed")

    # Step 2: Perform an INNER JOIN with tr_users on user_id
    merged_df = completed_trades.join(tr_users, "user_id", "inner")

    # Step 3: Count total completed orders per city
    city_trade_counts = merged_df.groupBy("city").agg(F.count("*").alias("total_orders"))

    # Step 4: Sort by total_orders in descending order and limit to top 3
    result_df = city_trade_counts.orderBy(col("total_orders").desc()).limit(3)

    return result_df
