/* Rialuecho
 * Authors: Arthur Pires, Josenildo Vicente, Renato Joaquim
 * Creation date: 07/03/2021
 */
MACHINE
    Rialuecho
SEES
    Rialuecho_ctx,
    Compra_ctx
VARIABLES
    carrinhos ,
    lista_produtos,
    produts
INVARIANT
    carrinhos : POW ( num_carrinho )
    & produts : ids_produto +-> struct(qtd: NAT, valor: NAT)
    & lista_produtos : carrinhos +-> POW ( produts )

INITIALISATION
    carrinhos := {}
    || lista_produtos := {}
    || produts := {}
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
    adicionar_produto (id_produto, produto) =
    PRE
        produto : struct(qtd: NAT, valor: NAT)
        & id_produto : ids_produto
        & id_produto /: dom(produts)
        & produto'qtd > 0
        & produto'valor > 0
    THEN
        produts := produts \/ {id_produto |-> produto}
    END
    ;
    remover_produto (id_produto, qtd) =
    PRE
        id_produto : ids_produto
        & id_produto : dom(produts)
        & qtd : NATURAL
        & qtd > 0
        & (produts(id_produto))'qtd >= qtd
    THEN
        produts := produts <+ {id_produto |-> rec(qtd : (produts(id_produto))'qtd - qtd, valor : (produts(id_produto))'valor)}
    END
    ;
        
    adicionar_produto_ao_carrinho ( nome , xx, qtd ) =
    PRE
        nome : dom(produts)
        & nome : ids_produto
        & xx : num_carrinho
        & xx : dom(lista_produtos)
        & qtd : NAT
        & qtd > 0
        & (produts(nome))'qtd >= qtd
    THEN
        produts := produts <+ {nome |-> rec(qtd : (produts(nome))'qtd - qtd, valor : (produts(nome))'valor)}
        || lista_produtos := lista_produtos <+ { xx |-> ( (lista_produtos ( xx )) \/ { nome |-> rec(qtd : qtd, valor : (produts(nome))'valor) } ) }
    END
    ;
    remover_produto_do_carrinho ( prod , xx ) =
    PRE
        prod : produts
        & xx : num_carrinho
        & xx : dom(lista_produtos)
        & prod : lista_produtos ( xx )
    THEN
        lista_produtos := lista_produtos <+ { xx |-> ( lista_produtos ( xx ) - { prod } ) } // precisamos igualar ao adicionar
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