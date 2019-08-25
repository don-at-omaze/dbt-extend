{%- macro empty_to_na(col, na_val='(N/A)') -%}
coalesce(nullif(nullif(trim({{ col }}), ''), 'N/A'), '{{ na_val }}')
{%- endmacro -%}