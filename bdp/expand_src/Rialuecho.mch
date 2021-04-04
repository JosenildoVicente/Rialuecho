/* Rialuecho
 * Authors: Arthur Pires, Josenildo Vicente, Renato Joaquim
 * Creation date: 07/03/2021
 */
MACHINE
    Rialuecho
SEES
    Rialuecho_ctx
ABSTRACT_VARIABLES
    carrinhos ,
    produtos_por_carrinho ,
    produts ,
    produts_disponibilidade ,
    historico_compra ,
    lucro_dia

INVARIANT
    carrinhos : FIN ( num_carrinho )
    & produts : ids_produto +-> struct ( qtd : NAT , valor : NAT ) //estoque total
    & produts_disponibilidade : ids_produto +-> NAT
    & dom ( produts_disponibilidade ) = dom ( produts )
    & ! pp . ( pp : dom ( produts_disponibilidade ) => produts_disponibilidade ( pp ) <= ( produts ( pp ) ) ' qtd )
    & produtos_por_carrinho : carrinhos +-> ( ids_produto +-> struct ( qtd : NAT ) )
    & historico_compra : seq ( struct ( id_prod : ids_produto , qtd : NAT , valor : NAT ) ) // INT -> natural
    & lucro_dia : FIN ( NAT )
INITIALISATION
    carrinhos := {}
    || produtos_por_carrinho := {}
    || produts := {}
    || produts_disponibilidade := {}
    || historico_compra := []
    || lucro_dia := {}
OPERATIONS

    //Operacao para adicionar um carrinho novo
    adicionar_carrinho ( xx ) =
    PRE
        xx : num_carrinho
        & xx /: carrinhos
    THEN
        carrinhos := carrinhos \/ { xx }
        || produtos_por_carrinho := produtos_por_carrinho \/ { xx |-> {} }
    END
    ;

    //Operacao para apagar um carrinho
    dropar_carrinho ( xx ) =
    PRE
        xx : num_carrinho
        & xx : carrinhos
        & xx : dom ( produtos_por_carrinho )
        & { prod | # ( id_prod ) . ( id_prod : dom ( produtos_por_carrinho ( xx ) ) & id_prod : dom ( produts_disponibilidade ) & prod = id_prod |-> produts_disponibilidade ( id_prod ) + ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd ) } : ids_produto +-> NAT
    THEN
        produts_disponibilidade := produts_disponibilidade <+ { prod | # id_prod . ( id_prod : dom ( produtos_por_carrinho ( xx ) ) & id_prod : dom ( produts_disponibilidade ) & prod = id_prod |-> produts_disponibilidade ( id_prod ) + ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd ) }
        || produtos_por_carrinho := { xx } <<| produtos_por_carrinho
        || carrinhos := carrinhos - { xx }
    END
    ;

    //Operacao para adicionar um produto (ou atualizar) na no estoque
    adicionar_produto ( id_produto , produto ) =
    PRE
        produto : struct ( qtd : NAT , valor : NAT )
        & id_produto : ids_produto
        & produto ' qtd > 0
        & produto ' valor > 0
        & { id_produto |-> produto ' qtd } : ids_produto +-> NAT
    THEN
        IF
            id_produto /: dom ( produts )
        THEN
            produts := produts \/ { id_produto |-> produto }
            || produts_disponibilidade := produts_disponibilidade \/ { id_produto |-> produto ' qtd }
        ELSE
            produts := produts <+ { id_produto |-> rec ( qtd : ( produts ( id_produto ) ) ' qtd + produto ' qtd , valor : produto ' valor ) }
            || produts_disponibilidade := produts_disponibilidade <+ { id_produto |-> ( produts_disponibilidade ( id_produto ) + produto ' qtd ) }
        END
    END
    ;

    //Operacao para remover uma quantidade especifica de um determinado produto do estoque
    remover_produto ( id_produto , qtd ) =
    PRE
        id_produto : ids_produto
        & id_produto : dom ( produts )
        & qtd : NATURAL
        & qtd > 0
        & ( produts ( id_produto ) ) ' qtd >= qtd
        & produts_disponibilidade ( id_produto ) >= qtd
        & { id_produto |-> rec ( qtd : ( produts ( id_produto ) ) ' qtd - qtd , valor : ( produts ( id_produto ) ) ' valor ) } : ids_produto +-> struct ( qtd : NAT , valor : NAT )
    THEN
        produts := produts <+ { id_produto |-> rec ( qtd : ( produts ( id_produto ) ) ' qtd - qtd , valor : ( produts ( id_produto ) ) ' valor ) }
        || produts_disponibilidade := produts_disponibilidade <+ { id_produto |-> ( produts_disponibilidade ( id_produto ) - qtd ) }
    END
    ;

    //Operacao para adicionar ao carrinho uma quantidade determinada de um produto especifico
    adicionar_produto_ao_carrinho ( nome , xx , qtd ) =
    PRE
        nome : dom ( produts )
        & nome : ids_produto
        & xx : num_carrinho
        & xx : carrinhos
        & xx : dom ( produtos_por_carrinho )
        & qtd : NAT
        & qtd > 0
        & produts_disponibilidade ( nome ) >= qtd

    THEN
        produts_disponibilidade := produts_disponibilidade <+ { nome |-> ( ( produts_disponibilidade ( nome ) ) - qtd ) }
        || IF
               nome : dom ( produtos_por_carrinho ( xx ) )
           THEN
               produtos_por_carrinho := produtos_por_carrinho <+ { xx |-> ( ( produtos_por_carrinho ( xx ) ) <+ { nome |-> rec ( qtd : ( produtos_por_carrinho ( xx ) ( nome ) ) ' qtd + qtd ) } ) }
           ELSE
               produtos_por_carrinho := produtos_por_carrinho <+ { xx |-> ( ( produtos_por_carrinho ( xx ) ) \/ { nome |-> rec ( qtd : qtd ) } ) }
           END
    END
    ;

    //Operacao para remover um produto especifico de um carrinho (remover todas quantidades)
    remover_produto_do_carrinho ( id_prod , xx ) =
    PRE
        id_prod : dom ( produts )
        & id_prod : ids_produto
        & xx : num_carrinho
        & xx : dom ( produtos_por_carrinho )
        & ! pc . ( pc : dom ( produtos_por_carrinho ( xx ) ) => pc = id_prod )
        & id_prod : dom ( ( produtos_por_carrinho ( xx ) ) )
        & { id_prod |-> produts_disponibilidade ( id_prod ) + ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd } : ids_produto +-> NAT
        & ( produts_disponibilidade ( id_prod ) + ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd ) <= ( produts ( id_prod ) ) ' qtd
    THEN
        produts_disponibilidade := produts_disponibilidade <+ { id_prod |-> ( produts_disponibilidade ( id_prod ) + ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd ) }
        || produtos_por_carrinho := produtos_por_carrinho <+ { xx |-> ( produtos_por_carrinho ( xx ) - { id_prod |-> rec ( qtd : ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd ) } ) }

    END
    ;

    //Operacao de finalizacao da compra
    comprar ( xx ) = // TODO: calcular valor total da compra, colocar esse valor em algo...
    PRE
        xx : num_carrinho
        & xx : dom ( produtos_por_carrinho )
        & produtos_por_carrinho ( xx ) /= {}
        & historico_compra : seq ( ran ( historico_compra ) )
        & { prod | # ( id_prod ) . ( id_prod : dom ( produtos_por_carrinho ( xx ) ) & id_prod : dom ( produts ) & prod = id_prod |-> rec ( qtd : ( produts ( id_prod ) ) ' qtd - ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd , valor : ( produts ( id_prod ) ) ' valor ) ) } : ids_produto +-> struct ( qtd : NAT , valor : NAT )
    THEN
        ANY
            aa
        WHERE
            aa : seq ( struct ( id_prod : ids_produto , qtd : NAT , valor : NAT ) )
            & { compra | # ( id_prod ) . ( id_prod : dom ( produtos_por_carrinho ( xx ) ) & id_prod : dom ( produts ) & compra = rec ( id_prod : id_prod , qtd : ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd , valor : ( produts ( id_prod ) ) ' valor ) ) } : FIN ( { compra | # ( id_prod ) . ( id_prod : dom ( produtos_por_carrinho ( xx ) ) & id_prod : dom ( produts ) & compra = rec ( id_prod : id_prod , qtd : ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd , valor : ( produts ( id_prod ) ) ' valor ) ) } )
            & aa : perm ( { compra | # id_prod . ( id_prod : dom ( produtos_por_carrinho ( xx ) ) & id_prod : dom ( produts ) & compra = rec ( id_prod : id_prod , qtd : ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd , valor : ( produts ( id_prod ) ) ' valor ) ) } )
        THEN
            historico_compra := historico_compra ^ aa
        END
        || produts := produts <+ { prod | # id_prod . ( id_prod : dom ( produtos_por_carrinho ( xx ) ) & id_prod : dom ( produts ) & prod = id_prod |-> rec ( qtd : ( ( produts ( id_prod ) ) ' qtd - ( produtos_por_carrinho ( xx ) ( id_prod ) ) ' qtd ) , valor : ( produts ( id_prod ) ) ' valor ) ) }

        || produtos_por_carrinho := { xx } <<| produtos_por_carrinho
        || carrinhos := carrinhos - { xx }
    END
    ;

    //Relatorio que retorna o valor total arrecardado com as vendas
    rd <-- relatorio_dia =
    BEGIN
        lucro_dia := { SIGMA xx . ( xx : ran ( historico_compra ) | xx ' qtd * xx ' valor * card ( historico_compra |> { xx } ) ) }
        || rd := lucro_dia
    END


END
