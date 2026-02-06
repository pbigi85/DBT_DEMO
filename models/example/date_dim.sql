with CTE as (

select    
    TO_TIMESTAMP(STARTED_AT) as STARTED_AT, 
    DATE(STARTED_AT) as DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) as HOUR_STARTED_AT,
    WEEK(TO_TIMESTAMP(STARTED_AT)) as WEEK_STARTED_AT,
    DAYOFWEEK(TO_TIMESTAMP(STARTED_AT)) as DAOFWEEK_STARTED_AT,
    DAYNAME(TO_TIMESTAMP(STARTED_AT)) as DAYNAME_STARTED_AT,
    MONTH((TO_TIMESTAMP(STARTED_AT))) AS MONTH_STARTED_AT,
    {{ day_type('started_at') }} as DAYTPE,
    {{ season('started_at') }} as SEASON_STARTED_AT,
    {{ function1('started_at') }} as timetype
from {{ ref('stg_bike') }}
where STARTED_AT != 'started_at'

)

select
*
from CTE