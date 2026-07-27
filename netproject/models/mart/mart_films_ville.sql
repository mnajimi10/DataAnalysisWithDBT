{{
    config(
        materialized='table'
    )
}}

with fct_scores as (
    select * from {{ref('fact_scores')}}
),

seed_dates as (
    select * from {{ref('seed_films_dates')}}
)

select f.*,
      case 
         when s.date is null then 'PasOK'
         else 'OK'

      end as date_info
from fct_scores f
left join seed_dates s
on f.film_id = s.film_id         