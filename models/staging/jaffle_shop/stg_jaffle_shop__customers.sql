with 

source as (

  select * from {{ ref('customers') }}

),

transformed as (

  select 

    id as customer_id,
    last_name as customer_last_name,
    first_name as customer_first_name,
    first_name || ' ' || last_name as customer_full_name

  from source

)

select * from transformed