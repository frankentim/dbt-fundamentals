-- {% set old_etl_relation=ref('customer_orders') %} 

-- {% set dbt_relation=ref('fct_customer_orders') %}  

-- {{ 

-- audit_helper.compare_relations(
--         a_relation=old_etl_relation,
--         b_relation=dbt_relation,
--         primary_key="order_id"
--     ) }}

{# in dbt Develop #}

{% set old_etl_relation=adapter.get_relation(
      database="SANDBOX_TIMFRANKEN",
      schema="dbt_tfranken",
      identifier="customer_orders"
) -%}

{% set dbt_relation=ref('fct_customer_orders') %}

{{ audit_helper.compare_relations(
    a_relation=old_etl_relation,
    b_relation=dbt_relation,
    primary_key="order_id"
) }}