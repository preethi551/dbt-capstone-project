select * from {{ ref('SILVER_AIRPORTS') }}
 where AIRPORT_TYPE='small_airport'