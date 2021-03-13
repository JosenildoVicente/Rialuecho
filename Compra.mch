/* Compra
 * Author: 
 * Creation date: 07/03/21
 */
MACHINE
    Compra
SEES
    Compra_ctx,
    Rialuecho_ctx
ABSTRACT_VARIABLES
    estado_da_compra
INVARIANT
    estado_da_compra: estados_da_compra
    
INITIALISATION
    ANY estado WHERE estado: estados_da_compra THEN estado_da_compra := estado END
OPERATIONS
    comprar ( metodo_de_pagamento ) =
    PRE
        metodo_de_pagamento : metodos_de_pagamento
    THEN
        ANY estado WHERE estado: estados_da_compra THEN estado_da_compra := estado END
    END
//    comprar ( xx ) =
//    PRE
//        xx : num_carrinho
//        & xx : carrinhos
//        & lista_produtos ( xx ) /= {}
//    THEN
//        lista_produtos := { xx } <<| lista_produtos
//        || carrinhos := carrinhos - { xx }
//    END
END
