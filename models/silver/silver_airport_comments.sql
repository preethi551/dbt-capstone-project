{{
    config(
        materialized='incremental',
        on_schema_change='append_new_columns'

    )
}}
with comments as (

      select * from {{ ref('src_airport_comments') }}
)
select 
comment_id,
airport_ident,
  nvl(member_nickname,'__UNKNOWN__') as member_nickname ,
  comment_subject,
  comment_body,
  current_timestamp() as loaded_at  
  from comments 
  where comment_body is not null  

  {% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    and  comment_id > (select max(comment_id) from {{ this }}) 
  {% endif %}
  