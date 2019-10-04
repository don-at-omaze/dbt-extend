{%- macro get_local_time(tz=None) -%}
{{ deprecation_warning('get_local_time', 'dbt_date.now()') }}
{{ dbt_date.now(tz) }}
{%- endmacro -%}