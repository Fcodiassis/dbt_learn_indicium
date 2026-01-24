with 

source as (

    select * from {{ ref('stg_sap_aworks__production_product') }}

),

renamed as (

    select
        productid,
        name as dsc_produto,
        productnumber,
        --makeflag,
        --finishedgoodsflag,
        --color,
        safetystocklevel

    from source

)

select * from renamed