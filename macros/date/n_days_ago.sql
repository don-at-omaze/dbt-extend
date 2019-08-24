{%- macro n_days_ago(n, tz=None) -%}
{%- set n = n|int -%}
{{ dbt_utils.dateadd('day', -1 * n, dbt_extend.get_local_date(tz)) }}
{%- endmacro -%}