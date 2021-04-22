#ifndef _Rialuecho_ctx_h
#define _Rialuecho_ctx_h

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */
typedef enum
{
    Rialuecho_ctx__num_carrinho0,
    Rialuecho_ctx__num_carrinho1,
    Rialuecho_ctx__num_carrinho2,
    Rialuecho_ctx__num_carrinho3,
    Rialuecho_ctx__num_carrinho4
    
} Rialuecho_ctx__num_carrinho;
#define Rialuecho_ctx__num_carrinho__max 5
typedef enum
{
    Rialuecho_ctx__ids_produto0,
    Rialuecho_ctx__ids_produto1,
    Rialuecho_ctx__ids_produto2,
    Rialuecho_ctx__ids_produto3,
    Rialuecho_ctx__ids_produto4
    
} Rialuecho_ctx__ids_produto;
#define Rialuecho_ctx__ids_produto__max 5

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Rialuecho_ctx__INITIALISATION(void);


#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Rialuecho_ctx_h */
