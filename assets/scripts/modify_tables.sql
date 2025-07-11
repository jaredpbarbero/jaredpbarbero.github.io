COPY youtube_fact
FROM 'C:/Users/jared/OneDrive/Desktop/Data Analyst EOY/Projects/YoutuberProject/Python/Data/youtube_data_from_python.csv'
DELIMITER ',' CSV HEADER;

SELECT usename FROM pg_user;