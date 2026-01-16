with 

source as (

    select * from {{ source('sap_aworks', 'sales_salesorderheadersalesreason') }}

),

renamed as (

    select
        salesorderid,
        salesreasonid
        --,modifieddate

    from source

)

select * from renamed