{%- macro get_local_date(tz=None) -%}
{{ dbt_extend.get_local_time(tz) }}::date
{%- endmacro -%}
