with 

source as (

    select * from {{ source('sap_aworks', 'sales_customer') }}

),

renamed as (

    select
        customerid,
        personid,
        --storeid,
        territoryid
        --,rowguid,
        --modifieddate

    from source
 
)

select * from renamed