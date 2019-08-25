{%- macro get_local_date(tz=None) -%}
cast({{ dbt_extend.get_local_time(tz) }} as date)
{%- endmacro -%}
