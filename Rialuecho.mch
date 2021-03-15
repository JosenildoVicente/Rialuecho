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
    produts_disponibilidade
INVARIANT
    carrinhos : POW ( num_carrinho )
    & produts : ids_produto +-> struct ( qtd : NAT , valor : NAT )//estoque total
    & produts_disponibilidade: ids_produto --> NAT
    & dom(produts_disponibilidade) = dom(produts)
    & ! pp . (pp : dom(produts) => produts_disponibilidade(pp) <= (produts(pp))'qtd)
    & produtos_por_carrinho : carrinhos +-> ( ids_produto +-> struct ( qtd : NAT) ) //valor está aqui desnecessáriamente - feito
//Colocar uma invariante para garantir que a quantidade do produto no estoque seja maior que a nos carrinhos
//Fazer uma variável 'disponibilidade' em que será verificado a quantidade de itens disponíveis do produto, e mexer no estoque somente no ato da compra. - Feito
INITIALISATION
    carrinhos := {}
    || produtos_por_carrinho := {}
    || produts := {}
    || produts_disponibilidade := {}
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
        || carrinhos := carrinhos - { xx } //TODO: retornar os produtos da lista para o estoque (deixar disponivel)
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
        produts := produts \/ { id_produto |-> produto }  //TODO: Colocar para poder adicionar mais itens ao produto já existente (reposição)
        || produts_disponibilidade := produts_disponibilidade \/ {id_produto |-> produto'qtd}
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
        & ( produts ( nome ) ) ' qtd >= qtd
    THEN
        produts_disponibilidade := produts_disponibilidade <+ {nome |-> (produts_disponibilidade(nome)- qtd)}
//        produts := produts <+ { nome |-> rec ( qtd : ( produts ( nome ) ) ' qtd - qtd , valor : ( produts ( nome ) ) ' valor ) }
        || produtos_por_carrinho := produtos_por_carrinho <+ { xx |-> ( ( produtos_por_carrinho ( xx ) ) \/ { nome |-> rec ( qtd : qtd ) } ) } // TODO: Rever POs, colocar para poder colocar mais itens de um produto que já esteja no carrinho (já está podendo escolher essa opção mas ele não reescreve, só tenta adicionar um novo)
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
//        produts := produts <+ (! id_prod . (id_prod: dom(produtos_por_carrinho(xx)) => (produts(id_prod))'qtd = (produts(id_prod))'qtd - (produtos_por_carrinho(xx)(id_prod))'qtd))
//        produts := produts <+ ! id_prods . ( id_prods = produtos_por_carrinho(xx)) 
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
