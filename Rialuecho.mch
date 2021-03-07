/* Rialuecho
 * Authors: Arthur Pires, Josenildo Vicente, Renato Joaquim
 * Creation date: 07/03/2021
 */
MACHINE
    Rialuecho
SEES
    Rialuecho_ctx
VARIABLES
    carrinhos,
    lista_produtos
INVARIANT
    carrinhos: POW(num_carrinho)
    & lista_produtos: num_carrinho +-> POW(produto)
    
INITIALISATION
    carrinhos := {}
    || lista_produtos := {}
OPERATIONS
    adicionar_carrinho(xx) = 
    PRE
        xx : num_carrinho
        & xx /: carrinhos
    THEN
        carrinhos := carrinhos \/ {xx}
        || lista_produtos:= lista_produtos \/ {xx |-> {}}
            
    END
    ;
    dropar_carrinho(xx) =
    PRE
        xx : num_carrinho
        & xx : carrinhos
    THEN
        lista_produtos := {xx} <<| lista_produtos
        || carrinhos := carrinhos - {xx}
    END
    ;
    adicionar_produto(prod, xx) = 
    PRE
        prod : produto
        & xx : num_carrinho
        & xx: carrinhos
        & prod /: lista_produtos(xx)
    THEN
        lista_produtos := lista_produtos <+ {xx |-> (lista_produtos(xx) \/ {prod})}
    END
    ;
    remover_produto(prod, xx) =
    PRE
        prod: produto
        & xx: num_carrinho
        & xx: carrinhos
        & prod: lista_produtos(xx)
    THEN
        lista_produtos := lista_produtos <+ {xx |-> (lista_produtos(xx) - {prod})}
    END
    
END
