with 

source as (

    select * from {{ ref('stg_sap_aworks__production_product') }}

),

renamed as (

    select
        productid,
        name as dsc_produto,
        productnumber,
        makeflag,
        finishedgoodsflag,
        --color,
        safetystocklevel,
        reorderpoint,
        standardcost,
        listprice,
        --size,
        --sizeunitmeasurecode,
        --weightunitmeasurecode,
        --weight,
        --daystomanufacture,
        productline,
        class,
        style
        --,productsubcategoryid,
        --productmodelid,
        --sellstartdate,
        --sellenddate,
        --discontinueddate
        --rowguid,
        --modifieddate

    from source

)

select * from renamed