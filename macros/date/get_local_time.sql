{%- macro get_local_time(tz=None) -%}
{{ dbt_extend.convert_timezone(dbt_utils.current_timestamp(), tz) }}
{%- endmacro -%}