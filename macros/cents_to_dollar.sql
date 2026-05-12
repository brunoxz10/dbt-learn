{% macro cents_to_dollar(column, decimal=2) %}
    round({{ column }} * 1.0 / 100, {{ decimal }})
{% endmacro%}