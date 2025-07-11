/*

1. Define the variables
2. Create a CTE that rounds the average views per video
3. Select the columns that are required for the analysis
4. Filter the results by the YouTube channels with the most videos
5. Order by net_profit (from highest to lowest)

*/
--1.
WITH params AS (
    SELECT 
        0.02::FLOAT AS conversion_rate,
        5.0::NUMERIC AS product_cost,
        55000.0::NUMERIC AS campaign_cost
),
--2.
ChannelData AS (
    SELECT
        channel_name,
        total_videos,
        total_views,
        ROUND(total_views::NUMERIC/ total_videos, -4) AS rounded_avg_views_per_video
    FROM view_uk_youtubers_2024

),

--SELECT * FROM ChannelData

--3.

Final AS(
    SELECT
        c.channel_name,
        c.rounded_avg_views_per_video,
        (c.rounded_avg_views_per_video * p.conversion_rate) AS potential_units_sold_per_video,
        (c.rounded_avg_views_per_video * p.conversion_rate * p.product_cost) AS potential_revenue_per_video,
        ((c.rounded_avg_views_per_video * p.conversion_rate * p.product_cost) - p.campaign_cost) AS net_profit
    FROM ChannelData AS C
    CROSS JOIN params p
)

--4.
SELECT *
FROM Final
WHERE channel_name IN ('GRM Daily','Man City','YOGSCAST Lewis & Simon')

--5.
ORDER BY net_profit DESC;
