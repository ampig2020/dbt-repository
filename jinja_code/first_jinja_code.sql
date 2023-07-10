{% set my_cool_string = 'Wow cool'  %}
{% set my_second_cool_string = 'Im so Cool'%}
{% set my_third_cool_string = 100 %}

{{my_cool_string}} {{my_second_cool_string}}

{% set set_my_array = ['lion', 'tiger', 'dog', 'seal'] %}

{{set_my_array[0]}}
{{set_my_array[1]}}
{{set_my_array[2]}}
{{set_my_array[3]}}


{% for pets in set_my_array %}
    My Favourite Pet is the {{pets}}

{% endfor %}

{% set temperature = 75 %}

{% if temperature > 100 %}

    Time for cold tea

{% else %}

    Time for a hot coffee
    
{% endif %}
