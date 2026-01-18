with 

source as (

    select * from {{ ref('stg_sap_aworks__person_person') }}

),

renamed as (

    select
        businessentityid,
        persontype,
        namestyle,
        title,
        firstname,
        middlename,
        lastname,
        suffix,
        emailpromotion
        --,additionalcontactinfo
        --,demographics,
        --rowguid,
        --modifieddate

    from source

)

select * from renamed