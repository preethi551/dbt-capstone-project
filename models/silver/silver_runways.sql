with  runways AS (
    select * from {{ ref('src_runways') }}
)
select  
    runway_id,
    airport_ident,
     runway_length_ft,
     runway_width_ft,
    case
    when RUNWAY_SURFACE is null or RUNWAY_SURFACE='' then '__UNKNOWN__'
     else RUNWAY_SURFACE
    end as runway_surface,
     runway_lighted,
     runway_closed
     from runways
     