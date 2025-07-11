CREATE VIEW view_uk_youtubers_2024 AS 
SELECT
    CAST(split_part(nombre,' @',1) AS TEXT) AS channel_name,
    total_subscribers,
    total_views,
    total_videos
FROM youtube_fact

SELECT *
FROM view_uk_youtubers_2024