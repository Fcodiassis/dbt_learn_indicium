with 

cliente as (

    select * from {{ ref('stg_sap_aworks__person_person') }}

),

cliente_person as (

    select * from {{ ref('stg_sap_aworks__sales_customer') }}

),

renamed as (

    select
        cliente_person.customerid,
        cliente.businessentityid as personid,
        --cliente.persontype,
        --namestyle,
        --cliente.title,
        concat(ifnull(cliente.firstname,''),' ',ifnull(cliente.middlename,''),' ',ifnull(cliente.lastname,''),' ',ifnull(cliente.suffix,'')) as nome_completo
        --,cliente.emailpromotion

    from cliente
    inner join cliente_person
    on cliente.businessentityid = cliente_person.personid 
)

select * from renamed