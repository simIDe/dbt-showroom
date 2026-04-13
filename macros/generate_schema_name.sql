{% macro generate_schema_name(custom_schema_name, node) -%}
    {#
        Best practice: always combine target schema + custom schema name.
        This ensures full environment isolation:
          dev  + staging → localbike_dev_staging
          dev  + marts   → localbike_dev_marts
          prod + staging → localbike_prod_staging
          prod + marts   → localbike_prod_marts
    #}
    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}
        {{ default_schema }}
    {%- else -%}
        {{ default_schema }}_{{ custom_schema_name | trim }}
    {%- endif -%}
{%- endmacro %}
