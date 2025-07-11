/*

#Data Quality tests

1. The data needs to contain 100 records of youtube channels (row count test)

2. The data needs 4 fields (column count test)

3. The channel name column must be text format, and the other columns must be number data types (data type check)

4. Each record must be unique in the dataset (duplicate count check)

Row count - 100
Column count - 4

Data types 
channel_name  = text
total_subscribers = number
total_views = number
total_videos = number

Duplicate count = 0

*/

-- 1. Checks if records contain 100 rows
SELECT 
    COUNT(*) AS total_rows
FROM view_uk_youtubers_2024;

-- 2. Checks if records contain 4 columns
SELECT COUNT (*) AS column_count 
FROM INFORMATION_SCHEMA.columns
WHERE table_catalog = 'youtube_db'
AND table_name = 'view_uk_youtubers_2024'

--3. Checks if 
SELECT
    column_name,
    data_type
FROM INFORMATION_SCHEMA.columns
WHERE table_catalog = 'youtube_db'
AND table_name = 'view_uk_youtubers_2024'

-- 4. Checks for duplicates in table
SELECT
    COUNT(*) AS duplicate_records,
    channel_name
FROM view_uk_youtubers_2024
GROUP BY
    channel_name
HAVING COUNT(*) > 1