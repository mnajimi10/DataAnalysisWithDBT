select film_id,
       score,
       score_timestamp
from {{ref('fact_scores')}}    
where score <=0 and
      score_timestamp IS NULL


-- I could use the macro function if i want to test that a table columns are not null,
-- like this : 
-- {{check_valeurs_nulles(ref('dim_films'))}}
--> This will genrate somthing like this : 
--SELECT *
--FROM dim_fiml
--WHERE
--    film_id IS NULL
--    OR titre_de_film IS NULL
--    OR genre_array IS NULL
--    OR genre IS NULL


