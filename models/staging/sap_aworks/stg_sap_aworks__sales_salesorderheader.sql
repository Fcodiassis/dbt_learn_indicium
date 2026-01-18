with 

source as (

    select * from {{ source('sap_aworks', 'sales_salesorderheader') }}

),

renamed as (

    select
        salesorderid as pedido_id,
        --revisionnumber,
        orderdate as data_pedido,
        --duedate,
        shipdate as data_envio,
        status,
        --onlineorderflag,
        --purchaseordernumber,
        --accountnumber,
        customerid,
        --salespersonid,
        --territoryid,
        billtoaddressid as id_ender_cobranca,
        shiptoaddressid as id_ender_envio,
        shipmethodid,
        creditcardid,
        --creditcardapprovalcode,
        currencyrateid,
        subtotal as vlr_subtotal,
        taxamt as vlr_total_imposto,
        freight as vlr_total_frete,
        totaldue as vlr_total
        --,comment,
        --rowguid,
        --modifieddate

    from source

)

select * from renamed