with 

source as (

    select * from {{ source('sap_aworks', 'sales_creditcard') }}

),

renamed as (

    select
        creditcardid,
        cardtype,
        cardnumber,
        expmonth,
        expyear,
        modifieddate

    from source

)

select * from renamed