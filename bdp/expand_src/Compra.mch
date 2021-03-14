/* Compra
 * Author: 
 * Creation date: 07/03/21
 */
MACHINE
    Compra
SEES
    Compra_ctx
ABSTRACT_VARIABLES
    estado_da_compra
INVARIANT
    estado_da_compra : estados_da_compra

INITIALISATION
    ANY estado WHERE estado : estados_da_compra THEN estado_da_compra := estado END
OPERATIONS
    comprar ( metodo_de_pagamento ) =
    PRE
        metodo_de_pagamento : metodos_de_pagamento
    THEN
        ANY estado WHERE estado : estados_da_compra THEN estado_da_compra := estado END
    END
END
