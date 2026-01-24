with 

cliente as (

    select * from {{ ref('stg_sap_aworks__person_person') }}

),

cliente_venda as (

    select * from {{ ref('stg_sap_aworks__sales_customer') }}

),

renamed as (

    select
        cliente_venda.customerid,
        cliente.businessentityid as personid,
        --cliente.persontype,
        --namestyle,
        --cliente.title,
        concat(ifnull(cliente.firstname,''),' ',ifnull(cliente.middlename,''),' ',ifnull(cliente.lastname,''),' ',ifnull(cliente.suffix,'')) as nome_completo
        --,cliente.emailpromotion

    from cliente
    inner join cliente_venda
    on cliente.businessentityid = cliente_venda.personid 
)

select * from renamed