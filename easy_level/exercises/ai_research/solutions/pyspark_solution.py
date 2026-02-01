from pyspark.sql import functions as F
from pyspark.sql import Window as W

def etl(authors, research_papers):
    # Create a window specification partitioned by paper_id and ordered by author_id
    author_window = W.partitionBy("paper_id").orderBy("author_id")
    
    # Add row_number column to the authors DataFrame
    result = authors.withColumn(
        "row_number",
        F.row_number().over(author_window)
    )
    
    # Select and order columns as per the expected output
    result = result.select("author_id", "name", "paper_id", "row_number")
    
    # Sort the result by paper_id and row_number
    result = result.orderBy("paper_id", "row_number")
    
    return result