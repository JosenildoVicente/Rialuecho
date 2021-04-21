#ifndef _Rialuecho_h
#define _Rialuecho_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Rialuecho_ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Rialuecho__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Rialuecho__adicionar_carrinho(Rialuecho_ctx__num_carrinho xx);
extern void Rialuecho__dropar_carrinho(Rialuecho_ctx__num_carrinho xx);
extern void Rialuecho__adicionar_produto(Rialuecho_ctx__ids_produto id_produto, int32_t qtd, int32_t valor);
extern void Rialuecho__remover_produto(Rialuecho_ctx__ids_produto id_produto, int32_t qtd);
extern void Rialuecho__adicionar_produto_ao_carrinho(Rialuecho_ctx__ids_produto nome, Rialuecho_ctx__num_carrinho xx, int32_t qtd);
extern void Rialuecho__remover_produto_do_carrinho(Rialuecho_ctx__ids_produto id_prod, Rialuecho_ctx__num_carrinho xx);
extern void Rialuecho__comprar(Rialuecho_ctx__num_carrinho xx);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Rialuecho_h */
