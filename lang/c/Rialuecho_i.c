/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Rialuecho.h"

/* Clause SEES */
#include "Rialuecho_ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static bool Rialuecho__carrinhos_i[5];
static int32_t Rialuecho__produtos_qtd_i[5];
static int32_t Rialuecho__produtos_valor_i[5];
/* Clause INITIALISATION */
void Rialuecho__INITIALISATION(void)
{
    
    unsigned int i = 0;
    for(i = 0; i <= Rialuecho_ctx__num_carrinho__max-1;i++)
    {
        Rialuecho__carrinhos_i[i] = false;
    }
    for(i = 0; i <= Rialuecho_ctx__ids_produto__max-1;i++)
    {
        Rialuecho__produtos_qtd_i[i] = 0;
    }
    for(i = 0; i <= Rialuecho_ctx__ids_produto__max-1;i++)
    {
        Rialuecho__produtos_valor_i[i] = 0;
    }
}

/* Clause OPERATIONS */

void Rialuecho__adicionar_carrinho(Rialuecho_ctx__num_carrinho xx)
{
    {
        bool ee;
        
        ee = Rialuecho__carrinhos_i[xx];
        if(ee == false)
        {
            Rialuecho__carrinhos_i[xx] = true;
        }
    }
}

void Rialuecho__dropar_carrinho(Rialuecho_ctx__num_carrinho xx)
{
    {
        bool ee;
        
        ee = Rialuecho__carrinhos_i[xx];
        if(ee == true)
        {
            Rialuecho__carrinhos_i[xx] = false;
        }
    }
}

void Rialuecho__adicionar_produto(Rialuecho_ctx__ids_produto id_produto, int32_t qtd, int32_t valor)
{
    Rialuecho__produtos_qtd_i[id_produto] = Rialuecho__produtos_qtd_i[id_produto]+qtd;
    Rialuecho__produtos_valor_i[id_produto] = valor;
}

void Rialuecho__remover_produto(Rialuecho_ctx__ids_produto id_produto, int32_t qtd)
{
    Rialuecho__produtos_qtd_i[id_produto] = Rialuecho__produtos_qtd_i[id_produto]-qtd;
}

void Rialuecho__adicionar_produto_ao_carrinho(Rialuecho_ctx__ids_produto nome, Rialuecho_ctx__num_carrinho xx, int32_t qtd)
{
    ;
}

void Rialuecho__remover_produto_do_carrinho(Rialuecho_ctx__ids_produto id_prod, Rialuecho_ctx__num_carrinho xx)
{
    ;
}

void Rialuecho__comprar(Rialuecho_ctx__num_carrinho xx)
{
    ;
}

