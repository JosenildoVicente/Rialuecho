/* Rialuecho
 * Authors: Arthur Pires, Josenildo Vicente, Renato Joaquim
 * Creation date: 07/03/2021
 */
MACHINE
    Rialuecho
SEES
    Rialuecho_ctx,
    Compra_ctx
ABSTRACT_VARIABLES
    carrinhos ,
    lista_produtos
INVARIANT
    carrinhos : POW ( num_carrinho )
    & lista_produtos : carrinhos +-> POW ( produtos )

INITIALISATION
    carrinhos := {}
    || lista_produtos := {}
OPERATIONS
    adicionar_carrinho ( xx ) =
    PRE
        xx : num_carrinho
        & xx /: carrinhos
    THEN
        carrinhos := carrinhos \/ { xx }
        || lista_produtos := lista_produtos \/ { xx |-> {} }

    END
    ;
    dropar_carrinho ( xx ) =
    PRE
        xx : num_carrinho
        & xx : carrinhos
    THEN
        lista_produtos := { xx } <<| lista_produtos
        || carrinhos := carrinhos - { xx }
    END
    ;
    adicionar_produto ( prod , xx ) =
    PRE
        prod : produtos
        & xx : num_carrinho
        & xx : dom(lista_produtos)
        & prod /: lista_produtos ( xx )
    THEN
        lista_produtos := lista_produtos <+ { xx |-> ( lista_produtos ( xx ) \/ { prod } ) }
    END
    ;
    remover_produto ( prod , xx ) =
    PRE
        prod : produtos
        & xx : num_carrinho
        & xx : dom(lista_produtos)
        & prod : lista_produtos ( xx )
    THEN
        lista_produtos := lista_produtos <+ { xx |-> ( lista_produtos ( xx ) - { prod } ) }
    END
    ;
    comprar ( xx ) =
    PRE
        xx : num_carrinho
        & xx : dom(lista_produtos)
        & lista_produtos ( xx ) /= {}
    THEN
        lista_produtos := { xx } <<| lista_produtos
        || carrinhos := carrinhos - { xx }
    END
//    ;
//    finalizar_compra ( xx ) =
//    PRE
//        xx : num_carrinho
//        & xx : carrinhos
//        & lista_produtos ( xx ) /= {}
//        & estados_da_compra /= {} // Essa condicao esta errada
//    THEN
//        lista_produtos := { xx } <<| lista_produtos
//        || carrinhos := carrinhos - { xx }
//    END


END