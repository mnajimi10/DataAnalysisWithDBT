{% snapshot  snap_scores %}

{{
   config(
       target_schema='snapshots',
       unique_key=['user_id', 'film_id'],
       strategy='timestamp',
       updated_at='score_timestamp'
   )
}}

select 
    {{dbt_utils.generate_surrogate_key(['user_id', 'film_id'])}} as row_key,
    user_id,
    film_id,
    score,
    cast(score_timestamp as timestamp_ntz) as score_timestamp

from {{ref("src_scores")}}

{% endsnapshot %}
   

