
{{
    config(
        materialized='ephemeral'
    )
}}
with airport_comments as(
    select * from {{ source('comments', 'airport_comments') }}
)
select 
    id as comment_id,
    airportident as airport_ident,
    date as comment_timestamp,
    membernickname as member_nickname,
    subject as comment_subject,
    body as comment_body
    from  airport_comments