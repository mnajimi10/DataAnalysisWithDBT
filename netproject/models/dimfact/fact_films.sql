with filmInfos as (
    select film_id, user_id, score from ({{ref('src_scores')}})
),

tag as (
    select tag, film_id from ({{ref('src_tags')}})
), 


lien as ( 
    select imdb_id, film_id from ({{ref('src_liens')}})
)


select
    f.film_id,
    f.user_id,
    f.score,
    t.tag,
    l.imdb_id

from filmInfos f

left join tag t
    on f.film_id = t.film_id

left join lien l
    on f.film_id = l.film_id
