{% macro dates_base(start_date, end_date) -%}
with dates as
(
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="to_date('" ~ start_date ~ "', 'mm/dd/yyyy')",
        end_date="to_date('" ~ end_date ~ "', 'mm/dd/yyyy')",
       )
    }}
)
select
    d.date_day,
    case
        when date_part('dow', d.date_day) = 0 then 7
        else date_part('dow', d.date_day)
    end::int as day_of_week,
    date_trunc('month', d.date_day)::date as month_start_date,

    rank() over(partition by month_start_date, day_of_week order by date_day) as day_of_week_in_month,

from
    dates d
{% endmacro %}


{% macro recur_on_ymonth(month_number, col='month_of_year') -%}
{{ col }} = {{ month_number }}
{%- endmacro %}

{% macro recur_on_wday(wday, nth=None, col='day_of_week', col2='day_of_week_in_month') -%}
{{ col }} = {{ wday }}
{% if nth -%}
 and {{ col2 }} = {{ nth }}
{%- endif -%}
{%- endmacro %}

{% macro recur_on_weekdays(col='day_of_week') -%}
{{ col }} not in (7,8)
{%- endmacro %}

{% macro recur_on_weekends(col='day_of_week') -%}
{{ col }} in (7,8)
{%- endmacro %}


{% macro sch_seq(start_date, end_date, recurrance_rule=None) -%}
with base_dates as
(
    {{ dates_base(start_date, end_date) }}
),
rule_applied as ( 
    select
        d.date_day
    from
        base_dates d
    where
        1=1 
        {% if recurrance_rule %}
        and
        {{ recurrance_rule }}
        {% endif %}
)
select * from rule_applied
order by 1
{% endmacro %}

{# 
EXAMPLE USAGE:

{% set on_thanksgiving %}
{{ recur_on_ymonth(11) }} and
{{ recur_on_wday(4, 4) }} 
{% endset %}
with thanksgiving as (
    
    {{ sch_seq('2000-01-01', '2006-01-01', recurrance_rule=on_thanksgiving)}}
)
select * from thanksgiving 
#}