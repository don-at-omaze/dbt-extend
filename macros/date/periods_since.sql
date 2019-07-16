{%- macro periods_since(date_col, period_name='day', tz=None) -%}
{{ dbt_utils.datediff(date_col, dbt_extend.get_local_date(tz), period_name) }}
{%- endmacro -%}