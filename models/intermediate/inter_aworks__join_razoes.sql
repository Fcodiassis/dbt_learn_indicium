with

    -- import ctes

    razoes_pedidos as (
        select *
        from {{ ref('stg_sap_aworks__sales_salesorderheadersalesreason') }}

        
    )
    , razoes as (
        select *
        from {{ ref('stg_sap_aworks__sales_salesreason') }}
    )

    -- transformation

    , joined as (
        select
            razoes_pedidos.salesorderid
            , razoes_pedidos.salesreasonid
            , razoes_pedidos.modifieddate
            , razoes.name
            , razoes.reasontype

        from razoes_pedidos
        inner join razoes 
        on razoes_pedidos.salesorderid = razoes.salesorderid

    )

select * from joined