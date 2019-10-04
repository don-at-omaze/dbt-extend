{%- macro get_local_date(tz=None) -%}
{{ deprecation_warning('get_local_date', 'dbt_date.today()') }}
{{ dbt_date.today(tz) }}
{%- endmacro -%}
