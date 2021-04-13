{{
    config(
        materialized = 'ephemeral'
    )
}}
select 
    {{ dbt_date.tomorrow() }} as tomorrow
