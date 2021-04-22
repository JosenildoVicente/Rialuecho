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
static int32_t Rialuecho__produtos_por_carrinho_i[5][5];
static Rialuecho_ctx__ids_produto Rialuecho__ids_produto_i[2147483647+1];
static int32_t Rialuecho__valor_total_compras_i;
/* Clause INITIALISATION */
void Rialuecho__INITIALISATION(void)
{
    
    unsigned int i = 0, j= 0;
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
    for(i = 0; i <= Rialuecho_ctx__num_carrinho__max-1;i++)
    {
        Rialuecho__produtos_por_carrinho_i[i] = ({0});
    }
    Rialuecho__ids_produto_i[0] = Rialuecho_ctx__ids_produto0;
    Rialuecho__ids_produto_i[1] = Rialuecho_ctx__ids_produto1;
    Rialuecho__ids_produto_i[2] = Rialuecho_ctx__ids_produto2;
    Rialuecho__ids_produto_i[3] = Rialuecho_ctx__ids_produto3;
    Rialuecho__ids_produto_i[4] = Rialuecho_ctx__ids_produto4;
    Rialuecho__valor_total_compras_i = 0;
}

/* Clause OPERATIONS */

void Rialuecho__adicionar_carrinho(Rialuecho_ctx__num_carrinho carrinho)
{
    {
        bool ee;
        
        ee = Rialuecho__carrinhos_i[carrinho];
        if(ee == false)
        {
            Rialuecho__carrinhos_i[carrinho] = true;
        }
    }
}

void Rialuecho__dropar_carrinho(Rialuecho_ctx__num_carrinho carrinho)
{
    {
        bool ee;
        
        ee = Rialuecho__carrinhos_i[carrinho];
        if(ee == true)
        {
            Rialuecho__carrinhos_i[carrinho] = false;
        }
    }
    {
        int32_t ii;
        
        ii = 0;
        while((ii) < (5))
        {
            Rialuecho__produtos_qtd_i[Rialuecho__ids_produto_i[ii]] = Rialuecho__produtos_qtd_i[Rialuecho__ids_produto_i[ii]]+Rialuecho__produtos_por_carrinho_i[carrinho][Rialuecho__ids_produto_i[ii]];
            Rialuecho__produtos_por_carrinho_i[carrinho][Rialuecho__ids_produto_i[ii]] = 0;
            ii = ii+1;
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

void Rialuecho__adicionar_produto_ao_carrinho(Rialuecho_ctx__ids_produto id_produto, Rialuecho_ctx__num_carrinho carrinho, int32_t qtd)
{
    {
        int32_t ii;
        
        ii = Rialuecho__produtos_qtd_i[id_produto];
        if((ii) >= (qtd))
        {
            Rialuecho__produtos_qtd_i[id_produto] = ii-qtd;
            Rialuecho__produtos_por_carrinho_i[carrinho][id_produto] = (Rialuecho__produtos_por_carrinho_i[carrinho][id_produto])+qtd;
        }
    }
}

void Rialuecho__remover_produto_do_carrinho(Rialuecho_ctx__ids_produto id_produto, Rialuecho_ctx__num_carrinho carrinho)
{
    {
        int32_t ii;
        
        ii = Rialuecho__produtos_por_carrinho_i[carrinho][id_produto];
        Rialuecho__produtos_qtd_i[id_produto] = Rialuecho__produtos_qtd_i[id_produto]+ii;
        Rialuecho__produtos_por_carrinho_i[carrinho][id_produto] = 0;
    }
}

void Rialuecho__comprar(Rialuecho_ctx__num_carrinho carrinho)
{
    {
        int32_t ii;
        
        ii = 0;
        while((ii) < (5))
        {
            Rialuecho__valor_total_compras_i = Rialuecho__valor_total_compras_i+(Rialuecho__produtos_por_carrinho_i[carrinho][Rialuecho__ids_produto_i[ii]] * Rialuecho__produtos_valor_i[Rialuecho__ids_produto_i[ii]]);
            Rialuecho__produtos_por_carrinho_i[carrinho][Rialuecho__ids_produto_i[ii]] = 0;
            Rialuecho__carrinhos_i[carrinho] = false;
            ii = ii+1;
        }
    }
}

void Rialuecho__relatorio_dia(int32_t *rd)
{
    (*rd) = Rialuecho__valor_total_compras_i;
}

