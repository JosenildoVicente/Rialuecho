/* Rialuecho
 * Authors: Arthur Pires, Josenildo Vicente, Renato Joaquim
 * Creation date: 07/03/2021
 */
MACHINE
    Rialuecho
SEES
    Rialuecho_ctx ,
    Compra_ctx
ABSTRACT_VARIABLES
    carrinhos ,
    produtos_por_carrinho ,
    produts
INVARIANT
    carrinhos : POW ( num_carrinho )
    & produts : ids_produto +-> struct ( qtd : NAT , valor : NAT )
    & produtos_por_carrinho : carrinhos +-> ( ids_produto +-> struct ( qtd : NAT , valor : NAT ) )

INITIALISATION
    carrinhos := {}
    || produtos_por_carrinho := {}
    || produts := {}
OPERATIONS
    adicionar_carrinho ( xx ) =
    PRE
        xx : num_carrinho
        & xx /: carrinhos
    THEN
        carrinhos := carrinhos \/ { xx }
        || produtos_por_carrinho := produtos_por_carrinho \/ { xx |-> {} }
    END
    ;
    dropar_carrinho ( xx ) =
    PRE
        xx : num_carrinho
        & xx : carrinhos
    THEN
        produtos_por_carrinho := { xx } <<| produtos_por_carrinho
        || carrinhos := carrinhos - { xx }
    END
    ;
    adicionar_produto ( id_produto , produto ) =
    PRE
        produto : struct ( qtd : NAT , valor : NAT )
        & id_produto : ids_produto
        & id_produto /: dom ( produts )
        & produto ' qtd > 0
        & produto ' valor > 0
    THEN
        produts := produts \/ { id_produto |-> produto }
    END
    ;
    remover_produto ( id_produto , qtd ) =
    PRE
        id_produto : ids_produto
        & id_produto : dom ( produts )
        & qtd : NATURAL
        & qtd > 0
        & ( produts ( id_produto ) ) ' qtd >= qtd
    THEN
        produts := produts <+ { id_produto |-> rec ( qtd : ( produts ( id_produto ) ) ' qtd - qtd , valor : ( produts ( id_produto ) ) ' valor ) }
    END
    ;

    adicionar_produto_ao_carrinho ( nome , xx , qtd ) =
    PRE
        nome : dom ( produts )
        & nome : ids_produto
        & xx : num_carrinho
        & xx : dom ( produtos_por_carrinho )
        & qtd : NAT
        & qtd > 0
        & ( produts ( nome ) ) ' qtd >= qtd
    THEN
        produts := produts <+ { nome |-> rec ( qtd : ( produts ( nome ) ) ' qtd - qtd , valor : ( produts ( nome ) ) ' valor ) }
        || produtos_por_carrinho := produtos_por_carrinho <+ { xx |-> ( ( produtos_por_carrinho ( xx ) ) \/ { nome |-> rec ( qtd : qtd , valor : ( produts ( nome ) ) ' valor ) } ) } // TODO: Rever POs
    END
    ;
    remover_produto_do_carrinho ( id_prod , xx ) =
    PRE
        id_prod : dom ( produts )
        & id_prod : ids_produto
        & xx : num_carrinho
        & xx : dom ( produtos_por_carrinho )
        & ! pc . ( pc : dom ( produtos_por_carrinho ( xx ) ) => pc = id_prod )




    THEN
//        LET prod BE prod = pr. ( pr: produtos_por_carrinho(xx) => pr'id_prod = id_prod )
//        IN
////            produts := produts <+ {id_prod |-> rec(qtd: (produts(id_prod))'qtd + (prod)'qtd, valor: (produts(id_prod))'valor) } 
        produts := produts <+ { id_prod |-> rec ( qtd : ( produts ( id_prod ) ) ' qtd + ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd , valor : ( produts ( id_prod ) ) ' valor ) }
        || produtos_por_carrinho := produtos_por_carrinho <+ { xx |-> ( produtos_por_carrinho ( xx ) - { id_prod |-> rec ( qtd : ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd , valor : ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' valor ) } ) }
//        END
    END
    ;
    comprar ( xx ) = // reajust
    PRE
        xx : num_carrinho
        & xx : dom ( produtos_por_carrinho )
        & produtos_por_carrinho ( xx ) /= {}
    THEN
        produtos_por_carrinho := { xx } <<| produtos_por_carrinho
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
