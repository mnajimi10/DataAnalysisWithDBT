select film_id,
       score,
       score_timestamp
from {{ref('fact_scores')}}    
where score <=0 and
      score_timestamp IS NULL
