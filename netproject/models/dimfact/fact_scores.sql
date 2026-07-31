{{
    config(
        materialized = 'incremental',
        on_schema_change='fail'
    )
}}


with src_scores as (
    select * from {{ref("src_scores")}}
)

select user_id,
       film_id,
       score,
       score_timestamp
from src_scores
where score is not null


{% if is_incremental() %}
  and score_timestamp > (select max(score_timestamp) from {{ this }})

{% endif %}


