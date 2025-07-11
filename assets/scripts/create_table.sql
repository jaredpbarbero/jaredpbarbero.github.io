CREATE TABLE public.youtube_fact (
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    seguidores TEXT,
    tp TEXT,
    pais TEXT,
    tema_de_influencia TEXT,
    alcance_potencial TEXT,
    guardar TEXT, 
    invitar_a_la_campana TEXT,
    channel_name TEXT,
    total_subscribers BIGINT,
    total_views BIGINT,
    total_videos INTEGER
);

SELECT *
FROM view_uk_youtubers_2024

DROP TABLE IF EXISTS public.youtube_fact CASCADE;
