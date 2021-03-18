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
    produts,
    produts_disponibilidade,
    historico_compra
    
INVARIANT
    carrinhos : POW ( num_carrinho )
    & produts : ids_produto +-> struct ( qtd : NAT , valor : NAT )//estoque total
    & produts_disponibilidade: ids_produto +-> NAT
    & dom(produts_disponibilidade) = dom(produts)
    & ! pp . (pp : dom(produts) => produts_disponibilidade(pp) <= (produts(pp))'qtd)
    & produtos_por_carrinho : carrinhos +-> ( ids_produto +-> struct ( qtd : NAT) ) 
    & historico_compra : seq(ids_produto +-> NAT) // INT -> natural
INITIALISATION
    carrinhos := {}
    || produtos_por_carrinho := {}
    || produts := {}
    || produts_disponibilidade := {}
    || historico_compra := []
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
//        produts := produts <+ { prod | # id_prod . (id_prod : dom(produtos_por_carrinho(xx)) & prod = id_prod |-> rec(qtd: ((produts(id_prod))'qtd - (produtos_por_carrinho(xx)(id_prod))'qtd), valor: (produts(id_prod))'valor)) }
        
        produts_disponibilidade := produts_disponibilidade <+ { prod | # id_prod . (id_prod : dom(produtos_por_carrinho(xx)) & prod = id_prod |-> produts_disponibilidade(id_prod) + (produtos_por_carrinho(xx)(id_prod))'qtd )}
        ||produtos_por_carrinho := { xx } <<| produtos_por_carrinho
        || carrinhos := carrinhos - { xx } //TODO: retornar os produtos da lista para o estoque (deixar disponivel)
    END
    ;
    adicionar_produto ( id_produto , produto ) =
    PRE
        produto : struct ( qtd : NAT , valor : NAT )
        & id_produto : ids_produto
        & produto ' qtd > 0
        & produto ' valor > 0
    THEN
        IF id_produto /: dom ( produts ) THEN
            produts := produts \/ { id_produto |-> produto }  
            || produts_disponibilidade := produts_disponibilidade \/ {id_produto |-> produto'qtd}
        ELSE 
            produts := produts <+ { id_produto |-> rec ( qtd : ( produts ( id_produto ) )'qtd + produto'qtd , valor : produto'valor ) }  
            || produts_disponibilidade := produts_disponibilidade <+ {id_produto |-> (produts_disponibilidade(id_produto) + produto'qtd) }
        END
    END
    ;
    remover_produto ( id_produto , qtd ) =
    PRE
        id_produto : ids_produto
        & id_produto : dom ( produts )
        & qtd : NATURAL
        & qtd > 0
        & ( produts ( id_produto ) ) ' qtd >= qtd
        & produts_disponibilidade(id_produto) >= qtd
    THEN
        produts := produts <+ { id_produto |-> rec ( qtd : ( produts ( id_produto ) ) ' qtd - qtd , valor : ( produts ( id_produto ) ) ' valor ) }
        ||produts_disponibilidade := produts_disponibilidade <+ {id_produto |-> (produts_disponibilidade(id_produto) - qtd) }
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
        & produts_disponibilidade(nome) >= qtd
    THEN
        produts_disponibilidade := produts_disponibilidade <+ {nome |-> ((produts_disponibilidade(nome))- qtd)}
        || IF nome: dom(produtos_por_carrinho(xx)) THEN produtos_por_carrinho := produtos_por_carrinho <+ { xx |-> ( ( produtos_por_carrinho ( xx ) ) <+ { nome |-> rec ( qtd : (produtos_por_carrinho(xx)(nome))'qtd + qtd ) } ) }
           ELSE produtos_por_carrinho := produtos_por_carrinho <+ { xx |-> ( ( produtos_por_carrinho ( xx ) ) \/ { nome |-> rec ( qtd : qtd ) } ) } END
               // TODO: Rever POs, colocar para poder colocar mais itens de um produto que já esteja no carrinho (já está podendo escolher essa opção mas ele não reescreve, só tenta adicionar um novo)
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
        produts_disponibilidade := produts_disponibilidade <+ {id_prod |-> (produts_disponibilidade(id_prod) + (produtos_por_carrinho(xx)(id_prod))'qtd)}
//        produts := produts <+ { id_prod |-> rec ( qtd : ( produts ( id_prod ) ) ' qtd + ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd , valor : ( produts ( id_prod ) ) ' valor ) }
        || produtos_por_carrinho := produtos_por_carrinho <+ { xx |-> ( produtos_por_carrinho ( xx ) - { id_prod |-> rec ( qtd : ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd ) } ) }

    END
    ;
    comprar ( xx ) = // TODO: diminuir a quantidade dos produtos que é comprado, calcular valor total da compra, colocar esse valor em algo...
    PRE
        xx : num_carrinho
        & xx : dom ( produtos_por_carrinho )
        & produtos_por_carrinho ( xx ) /= {}
    THEN
        ANY 
            aa
        WHERE
            aa: perm( { compra | # id_prod . (id_prod : dom(produtos_por_carrinho(xx)) & compra = {(id_prod |-> (produtos_por_carrinho(xx)(id_prod))'qtd )}) } )
        THEN
            historico_compra := historico_compra ^ aa
        END

//        historico_compra := historico_compra ^ (seq_correto | # cor . (cor : perm(produtos_por_carrinho(xx))))
//        historico_compra := historico_compra ^ { compra | #ss .( ss : POW(1..card(produtos_por_carrinho(xx)) & compra = ss  |-> produtos_por_carrinho(xx))) }
//        historico_compra := historico_compra ^ perm(produtos_por_carrinho(xx))
// compra | # id_prod . (id_prod : dom(produtos_por_carrinho(xx)) & compra = rec(id_prod: id_prod, qtd: (produtos_por_carrinho(xx)(id_prod))'qtd))
//        historico_compra := historico_compra ^ { compra | # (id_prod, num) . (id_prod : dom(produtos_por_carrinho(xx)) & num: [1,2] & compra = ( size(historico_compra)) |-> rec(id_prod: id_prod, qtd: (produtos_por_carrinho(xx)(id_prod))'qtd)) }

//        historico_compra := historico_compra ^ { compra | # (id_prod, num) . (id_prod : dom(produtos_por_carrinho(xx)) & num: 0..card(produtos_por_carrinho(xx)) & compra = num |-> {(id_prod |-> (produtos_por_carrinho(xx)(id_prod))'qtd )}) }

        || produts := produts <+ { prod | # id_prod . (id_prod : dom(produtos_por_carrinho(xx)) & prod = id_prod |-> rec(qtd: ((produts(id_prod))'qtd - (produtos_por_carrinho(xx)(id_prod))'qtd), valor: (produts(id_prod))'valor)) }

        || produtos_por_carrinho := { xx } <<| produtos_por_carrinho
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
