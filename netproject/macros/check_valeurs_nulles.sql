 {% macro check_valeurs_nulles(model) %}

    select * 
    from {{model}} 
    where 
    {% for col in dbt_utils.get_columns_in_relation(model)%}
         {{col.column}} is null 

    {%endfor%}
  
{% endmacro %} 