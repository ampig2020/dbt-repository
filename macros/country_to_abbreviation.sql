{% macro country_to_abbreviation(country) %}
    {%- if country == 'United States' -%}
        'US'
    {%- else -%}
        {{ country }}
    {%- endif -%}
{% endmacro %}
