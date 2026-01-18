with 

cliente as (

    select * from {{ ref('stg_sap_aworks__person_person') }}

),

renamed as (

    select
        businessentityid as customerid,
        persontype,
        --namestyle,
        title,
        concat(ifnull(firstname,''),' ',ifnull(middlename,''),' ',ifnull(lastname,''),' ',ifnull(suffix,'')) as nome_completo,
        emailpromotion

    from cliente

)

select * from renamed