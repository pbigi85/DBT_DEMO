with trips as (

select
	RIDE_ID,
	-- RIDEABLE_TYPE,
	date(to_timestamp(STARTED_AT))                                                  as Trip_date,  
	START_STATIO_ID                                                                 as start_station_id,
	END_STATION_ID                                                                  as end_station_id,
	MEMBER_CSUAL                                                                    as MEMBER_CASUAL,                          
    TIMESTAMPDIFF(Second, to_timestamp(STARTED_AT), to_timestamp(ENDED_AT))         as trip_duration
from {{ ref('stg_bike') }}
where ride_id != 'ride_id'

)

select *
from trips