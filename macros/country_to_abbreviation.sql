{% macro country_to_abbreviation(country_column) %}
CASE
    WHEN {{ country_column }} = 'United States' THEN 'US'
    -- Add more country transformations here
    ELSE {{ country_column }}
END
{% endmacro %}
