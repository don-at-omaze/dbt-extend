{%- macro to_local_tz(column, target_tz=None, source_tz=None) -%}
{{ dbt_extend.convert_timezone(column, target_tz, source_tz) }} 
{%- endmacro -%}