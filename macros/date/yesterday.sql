{%- macro yesterday(tz=None) -%}
{{ dbt_utils.dateadd('day', -1, dbt_extend.get_local_date(tz)) }}
{%- endmacro -%}
