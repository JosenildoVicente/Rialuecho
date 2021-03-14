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
    produtos_por_carrinho,
    produts
INVARIANT
    carrinhos : POW ( num_carrinho )
    & produts : ids_produto +-> struct(qtd: NAT, valor: NAT)
    & produtos_por_carrinho : carrinhos +-> POW(struct(id_prod: ids_produto, qtd: NAT, valor: NAT))

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
    adicionar_produto (id_produto, produto) =
    PRE
        produto : struct(qtd: NAT, valor: NAT)
        & id_produto : ids_produto
        & id_produto /: dom(produts)
        & produto'qtd > 0
        & produto'valor > 0 // TODO: nao adicionar o mesmo produto de novo
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
        & xx : dom(produtos_por_carrinho)
        & qtd : NAT
        & qtd > 0
        & (produts(nome))'qtd >= qtd
    THEN
        produts := produts <+ {nome |-> rec(qtd : (produts(nome))'qtd - qtd, valor : (produts(nome))'valor)}
        || produtos_por_carrinho := produtos_por_carrinho <+ { xx |-> ( (produtos_por_carrinho ( xx )) \/ { rec(id_prod: nome, qtd : qtd, valor : (produts(nome))'valor) } ) } // TODO: Rever POs
    END
    ;
    remover_produto_do_carrinho ( id_prod , xx ) =
    PRE
        id_prod: ids_produto
        & xx : num_carrinho
        & xx : dom(produtos_por_carrinho)
//        & # prod . (prod : (produtos_por_carrinho ( xx )) => prod = { rec(id_prod: id_prod, qtd: NAT, valor: ANY) })
       // TODO: condicional de id_prod existir no carrinho
    THEN
        LET prod BE prod = {pr | pr : struct(id_prod: ids_produto, qtd: NAT, valor: NAT) & pr : (produtos_por_carrinho ( xx )) & pr'id_prod = id_prod}
        IN
          produtos_por_carrinho := produtos_por_carrinho <+ { xx |-> ( produtos_por_carrinho ( xx ) - prod ) }
//          || produts := produts <+ {id_prod |-> rec(qtd : (produts(id_prod))'qtd + prod'qtd, valor : (produts(id_prod))'valor)}
        END
    END
    ;
    comprar ( xx ) = // reajust
    PRE
        xx : num_carrinho
        & xx : dom(produtos_por_carrinho)
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