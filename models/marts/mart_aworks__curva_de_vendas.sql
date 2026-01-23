with
    -- import models
    int_curva as 
    (
        select *
        from {{ ref('inter_aworks__join_pedidos') }}
    )

    , int_localidade as 
    (
        select *
        from {{ ref('inter_aworks__join_localidades') }}
    )

    , int_produto as 
    (
        select *
        from {{ ref('mart_aworks__dim_produtos') }}
    )
    
--    , int_cliente as 
--    (
--        select *
--        from {{ ref('mart_aworks__dim_clientes') }}
--    )

    , metrics as (
        select
            int_curva.data_pedido
            , int_localidade.dsc_cidade
            , int_localidade.dsc_estado
            , int_localidade.dsc_pais
            , int_curva.productid
            , int_produto.dsc_produto
            , int_curva.customerid
--            , int_cliente.nome_completo
            , int_curva.creditcardid
            , int_curva.cardtype

            --, count(distinct int_curva.pedido_id) numero_de_pedidos
            , sum(int_curva.quantidade) as quantidade
            , sum(int_curva.vlr_unitario * int_curva.quantidade) as faturamento_bruto
            , sum(int_curva.vlr_unitario * (1 - int_curva.vlr_desconto) * int_curva.quantidade) as faturamento_com_desconto

        from int_curva
        inner join int_localidade
        on int_curva.id_ender_cobranca = int_localidade.addressid
        inner join int_produto
        on int_curva.productid = int_produto.productid
--        inner join int_cliente
--        on int_curva.customerid = int_cliente.customerid

        group by
            int_curva.data_pedido
            , int_localidade.dsc_cidade
            , int_localidade.dsc_estado
            , int_localidade.dsc_pais
            , int_curva.productid
            , int_produto.dsc_produto
            , int_curva.customerid
--            , int_cliente.nome_completo
            , int_curva.creditcardid
            , int_curva.cardtype

    )

select *
from metrics