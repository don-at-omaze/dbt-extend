{%- macro this_week(tz=None) -%}
{{ dbt_utils.date_trunc('week', dbt_extend.get_local_date(tz)) }}
{%- endmacro -%}