with 

source as (

    select * from {{ source('sap_aworks', 'sales_salesorderdetail') }}

),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key(['salesorderid','salesorderdetailid','productid'])}} as item_unico_pk,
        salesorderid as pedido_id,
        salesorderdetailid as item_id,
        --carriertrackingnumber,
        productid,
        orderqty as quantidade,
        specialofferid,
        unitprice as vlr_unitario,
        unitpricediscount as vlr_desconto
        --,rowguid,
        --modifieddate

    from source

)

select * from renamed