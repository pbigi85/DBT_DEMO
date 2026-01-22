{% macro function1(x) %}
  case
    when TO_TIMESTAMP({{ x }}) is null then null
    when TO_TIMESTAMP({{ x }}) < current_timestamp() then 'PAST'
    else 'FUTURE'
  end
{% endmacro %}


{% macro season(x) %}
    CASE WHEN MONTH((TO_TIMESTAMP({{ x }}))) IN ('12','1','2')THEN 'WINTER'
        WHEN MONTH((TO_TIMESTAMP({{ x }}))) IN ('3','4','5') THEN 'SPRING'
        WHEN MONTH((TO_TIMESTAMP({{ x }}))) IN ('6','7','8') THEN 'SUMMMER'
        ELSE 'AUTUMN' 
        END
{% endmacro %}


{% macro day_type(x) %}
    CASE
    WHEN DAYOFWEEK(TO_TIMESTAMP({{ x }})) >0 and DAYOFWEEK(TO_TIMESTAMP({{ x }})) <6 
    THEN 'BUSINESSDAY' 
    ELSE 'WEEKEND'
    END
{% endmacro %}

