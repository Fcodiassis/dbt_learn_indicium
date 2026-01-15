with

    -- import ctes

    paises as (
        select *
        from {{ ref('stg_sap_aworks__person_countryregion') }}
     
    )
    , estados as (
        select *
        from {{ ref('stg_sap_aworks__person_stateprovince') }}
    )

    , enderecos as (
        select *
        from {{ ref('stg_sap_aworks__person_address') }}
    )

    -- transformation

    , joined as (
        select
            enderecos.addressid
            ,enderecos.addressline1 as endereco
            ,enderecos.city as name_city
            ,estados.stateprovincecode
            ,estados.name as name_province
            ,paises.countryregioncode
            ,paises.name as name_country

        from enderecos a
        inner join estados b
        on a.stateprovinceid=b.stateprovinceid
        inner join paises c
        on b.countryregioncode=c.countryregioncode
    )

select * from joined