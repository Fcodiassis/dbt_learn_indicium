with 

source as (

    select * from {{ source('sap_aworks', 'person_countryregion') }}

),

renamed as (

    select
        countryregioncode,
        name as dsc_pais
        --,modifieddate

    from source

)

select * from renamed