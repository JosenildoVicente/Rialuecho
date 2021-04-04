Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Rialuecho))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Rialuecho))==(Machine(Rialuecho));
  Level(Machine(Rialuecho))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Rialuecho)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Rialuecho))==(Rialuecho_ctx)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Rialuecho))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Rialuecho))==(?);
  List_Includes(Machine(Rialuecho))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Rialuecho))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Rialuecho))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Rialuecho))==(?);
  Context_List_Variables(Machine(Rialuecho))==(?);
  Abstract_List_Variables(Machine(Rialuecho))==(?);
  Local_List_Variables(Machine(Rialuecho))==(lucro_dia,historico_compra,produts_disponibilidade,produts,produtos_por_carrinho,carrinhos);
  List_Variables(Machine(Rialuecho))==(lucro_dia,historico_compra,produts_disponibilidade,produts,produtos_por_carrinho,carrinhos);
  External_List_Variables(Machine(Rialuecho))==(lucro_dia,historico_compra,produts_disponibilidade,produts,produtos_por_carrinho,carrinhos)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Rialuecho))==(?);
  Abstract_List_VisibleVariables(Machine(Rialuecho))==(?);
  External_List_VisibleVariables(Machine(Rialuecho))==(?);
  Expanded_List_VisibleVariables(Machine(Rialuecho))==(?);
  List_VisibleVariables(Machine(Rialuecho))==(?);
  Internal_List_VisibleVariables(Machine(Rialuecho))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Rialuecho))==(btrue);
  Gluing_List_Invariant(Machine(Rialuecho))==(btrue);
  Expanded_List_Invariant(Machine(Rialuecho))==(btrue);
  Abstract_List_Invariant(Machine(Rialuecho))==(btrue);
  Context_List_Invariant(Machine(Rialuecho))==(btrue);
  List_Invariant(Machine(Rialuecho))==(carrinhos: FIN(num_carrinho) & produts: ids_produto +-> struct(qtd>>NAT,valor>>NAT) & produts_disponibilidade: ids_produto +-> NAT & dom(produts_disponibilidade) = dom(produts) & !pp.(pp: dom(produts_disponibilidade) => produts_disponibilidade(pp)<=produts(pp)'qtd) & produtos_por_carrinho: carrinhos +-> (ids_produto +-> struct(qtd>>NAT)) & historico_compra: seq(struct(id_prod>>ids_produto,qtd>>NAT,valor>>NAT)) & lucro_dia: FIN(NAT))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Rialuecho))==(btrue);
  Abstract_List_Assertions(Machine(Rialuecho))==(btrue);
  Context_List_Assertions(Machine(Rialuecho))==(btrue);
  List_Assertions(Machine(Rialuecho))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Rialuecho))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Rialuecho))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Rialuecho))==(carrinhos,produtos_por_carrinho,produts,produts_disponibilidade,historico_compra,lucro_dia:={},{},{},{},<>,{});
  Context_List_Initialisation(Machine(Rialuecho))==(skip);
  List_Initialisation(Machine(Rialuecho))==(carrinhos:={} || produtos_por_carrinho:={} || produts:={} || produts_disponibilidade:={} || historico_compra:=<> || lucro_dia:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Rialuecho))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Rialuecho),Machine(Rialuecho_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Rialuecho))==(btrue);
  List_Constraints(Machine(Rialuecho))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Rialuecho))==(adicionar_carrinho,dropar_carrinho,adicionar_produto,remover_produto,adicionar_produto_ao_carrinho,remover_produto_do_carrinho,comprar,relatorio_dia);
  List_Operations(Machine(Rialuecho))==(adicionar_carrinho,dropar_carrinho,adicionar_produto,remover_produto,adicionar_produto_ao_carrinho,remover_produto_do_carrinho,comprar,relatorio_dia)
END
&
THEORY ListInputX IS
  List_Input(Machine(Rialuecho),adicionar_carrinho)==(xx);
  List_Input(Machine(Rialuecho),dropar_carrinho)==(xx);
  List_Input(Machine(Rialuecho),adicionar_produto)==(id_produto,produto);
  List_Input(Machine(Rialuecho),remover_produto)==(id_produto,qtd);
  List_Input(Machine(Rialuecho),adicionar_produto_ao_carrinho)==(nome,xx,qtd);
  List_Input(Machine(Rialuecho),remover_produto_do_carrinho)==(id_prod,xx);
  List_Input(Machine(Rialuecho),comprar)==(xx);
  List_Input(Machine(Rialuecho),relatorio_dia)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Rialuecho),adicionar_carrinho)==(?);
  List_Output(Machine(Rialuecho),dropar_carrinho)==(?);
  List_Output(Machine(Rialuecho),adicionar_produto)==(?);
  List_Output(Machine(Rialuecho),remover_produto)==(?);
  List_Output(Machine(Rialuecho),adicionar_produto_ao_carrinho)==(?);
  List_Output(Machine(Rialuecho),remover_produto_do_carrinho)==(?);
  List_Output(Machine(Rialuecho),comprar)==(?);
  List_Output(Machine(Rialuecho),relatorio_dia)==(rd)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Rialuecho),adicionar_carrinho)==(adicionar_carrinho(xx));
  List_Header(Machine(Rialuecho),dropar_carrinho)==(dropar_carrinho(xx));
  List_Header(Machine(Rialuecho),adicionar_produto)==(adicionar_produto(id_produto,produto));
  List_Header(Machine(Rialuecho),remover_produto)==(remover_produto(id_produto,qtd));
  List_Header(Machine(Rialuecho),adicionar_produto_ao_carrinho)==(adicionar_produto_ao_carrinho(nome,xx,qtd));
  List_Header(Machine(Rialuecho),remover_produto_do_carrinho)==(remover_produto_do_carrinho(id_prod,xx));
  List_Header(Machine(Rialuecho),comprar)==(comprar(xx));
  List_Header(Machine(Rialuecho),relatorio_dia)==(rd <-- relatorio_dia)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Rialuecho),adicionar_carrinho)==(xx: num_carrinho & xx/:carrinhos);
  List_Precondition(Machine(Rialuecho),dropar_carrinho)==(xx: num_carrinho & xx: carrinhos & xx: dom(produtos_por_carrinho) & {prod | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts_disponibilidade) & prod = id_prod|->produts_disponibilidade(id_prod)+produtos_por_carrinho(xx)(id_prod)'qtd)}: ids_produto +-> NAT);
  List_Precondition(Machine(Rialuecho),adicionar_produto)==(produto: struct(qtd>>NAT,valor>>NAT) & id_produto: ids_produto & produto'qtd>0 & produto'valor>0 & {id_produto|->produto'qtd}: ids_produto +-> NAT);
  List_Precondition(Machine(Rialuecho),remover_produto)==(id_produto: ids_produto & id_produto: dom(produts) & qtd: NATURAL & qtd>0 & produts(id_produto)'qtd>=qtd & produts_disponibilidade(id_produto)>=qtd & {id_produto|->rec(qtd>>produts(id_produto)'qtd-qtd,valor>>produts(id_produto)'valor)}: ids_produto +-> struct(qtd>>NAT,valor>>NAT));
  List_Precondition(Machine(Rialuecho),adicionar_produto_ao_carrinho)==(nome: dom(produts) & nome: ids_produto & xx: num_carrinho & xx: carrinhos & xx: dom(produtos_por_carrinho) & qtd: NAT & qtd>0 & produts_disponibilidade(nome)>=qtd);
  List_Precondition(Machine(Rialuecho),remover_produto_do_carrinho)==(id_prod: dom(produts) & id_prod: ids_produto & xx: num_carrinho & xx: dom(produtos_por_carrinho) & !pc.(pc: dom(produtos_por_carrinho(xx)) => pc = id_prod) & id_prod: dom(produtos_por_carrinho(xx)) & {id_prod|->produts_disponibilidade(id_prod)+produtos_por_carrinho(xx)(id_prod)'qtd}: ids_produto +-> NAT & produts_disponibilidade(id_prod)+produtos_por_carrinho(xx)(id_prod)'qtd<=produts(id_prod)'qtd);
  List_Precondition(Machine(Rialuecho),comprar)==(xx: num_carrinho & xx: dom(produtos_por_carrinho) & produtos_por_carrinho(xx)/={} & historico_compra: seq(ran(historico_compra)) & {prod | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts) & prod = id_prod|->rec(qtd>>produts(id_prod)'qtd-produtos_por_carrinho(xx)(id_prod)'qtd,valor>>produts(id_prod)'valor))}: ids_produto +-> struct(qtd>>NAT,valor>>NAT));
  List_Precondition(Machine(Rialuecho),relatorio_dia)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Rialuecho),relatorio_dia)==(btrue | lucro_dia,rd:={SIGMA(xx).(xx: ran(historico_compra) | xx'qtd*xx'valor*card(historico_compra|>{xx}))},lucro_dia);
  Expanded_List_Substitution(Machine(Rialuecho),comprar)==(xx: num_carrinho & xx: dom(produtos_por_carrinho) & produtos_por_carrinho(xx)/={} & historico_compra: seq(ran(historico_compra)) & {prod | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts) & prod = id_prod|->rec(qtd>>produts(id_prod)'qtd-produtos_por_carrinho(xx)(id_prod)'qtd,valor>>produts(id_prod)'valor))}: ids_produto +-> struct(qtd>>NAT,valor>>NAT) | @aa.(aa: seq(struct(id_prod>>ids_produto,qtd>>NAT,valor>>NAT)) & {compra | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts) & compra = rec(id_prod>>id_prod,qtd>>produtos_por_carrinho(xx)(id_prod)'qtd,valor>>produts(id_prod)'valor))}: FIN({compra | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts) & compra = rec(id_prod>>id_prod,qtd>>produtos_por_carrinho(xx)(id_prod)'qtd,valor>>produts(id_prod)'valor))}) & aa: perm({compra | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts) & compra = rec(id_prod>>id_prod,qtd>>produtos_por_carrinho(xx)(id_prod)'qtd,valor>>produts(id_prod)'valor))}) ==> historico_compra:=historico_compra^aa) || produts:=produts<+{prod | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts) & prod = id_prod|->rec(qtd>>produts(id_prod)'qtd-produtos_por_carrinho(xx)(id_prod)'qtd,valor>>produts(id_prod)'valor))} || produtos_por_carrinho:={xx}<<|produtos_por_carrinho || carrinhos:=carrinhos-{xx});
  Expanded_List_Substitution(Machine(Rialuecho),remover_produto_do_carrinho)==(id_prod: dom(produts) & id_prod: ids_produto & xx: num_carrinho & xx: dom(produtos_por_carrinho) & !pc.(pc: dom(produtos_por_carrinho(xx)) => pc = id_prod) & id_prod: dom(produtos_por_carrinho(xx)) & {id_prod|->produts_disponibilidade(id_prod)+produtos_por_carrinho(xx)(id_prod)'qtd}: ids_produto +-> NAT & produts_disponibilidade(id_prod)+produtos_por_carrinho(xx)(id_prod)'qtd<=produts(id_prod)'qtd | produts_disponibilidade,produtos_por_carrinho:=produts_disponibilidade<+{id_prod|->produts_disponibilidade(id_prod)+produtos_por_carrinho(xx)(id_prod)'qtd},produtos_por_carrinho<+{xx|->produtos_por_carrinho(xx)-{id_prod|->rec(qtd>>produtos_por_carrinho(xx)(id_prod)'qtd)}});
  Expanded_List_Substitution(Machine(Rialuecho),adicionar_produto_ao_carrinho)==(nome: dom(produts) & nome: ids_produto & xx: num_carrinho & xx: carrinhos & xx: dom(produtos_por_carrinho) & qtd: NAT & qtd>0 & produts_disponibilidade(nome)>=qtd | produts_disponibilidade:=produts_disponibilidade<+{nome|->produts_disponibilidade(nome)-qtd} || (nome: dom(produtos_por_carrinho(xx)) ==> produtos_por_carrinho:=produtos_por_carrinho<+{xx|->(produtos_por_carrinho(xx)<+{nome|->rec(qtd>>produtos_por_carrinho(xx)(nome)'qtd+qtd)})} [] not(nome: dom(produtos_por_carrinho(xx))) ==> produtos_por_carrinho:=produtos_por_carrinho<+{xx|->(produtos_por_carrinho(xx)\/{nome|->rec(qtd>>qtd)})}));
  Expanded_List_Substitution(Machine(Rialuecho),remover_produto)==(id_produto: ids_produto & id_produto: dom(produts) & qtd: NATURAL & qtd>0 & produts(id_produto)'qtd>=qtd & produts_disponibilidade(id_produto)>=qtd & {id_produto|->rec(qtd>>produts(id_produto)'qtd-qtd,valor>>produts(id_produto)'valor)}: ids_produto +-> struct(qtd>>NAT,valor>>NAT) | produts,produts_disponibilidade:=produts<+{id_produto|->rec(qtd>>produts(id_produto)'qtd-qtd,valor>>produts(id_produto)'valor)},produts_disponibilidade<+{id_produto|->produts_disponibilidade(id_produto)-qtd});
  Expanded_List_Substitution(Machine(Rialuecho),adicionar_produto)==(produto: struct(qtd>>NAT,valor>>NAT) & id_produto: ids_produto & produto'qtd>0 & produto'valor>0 & {id_produto|->produto'qtd}: ids_produto +-> NAT | id_produto/:dom(produts) ==> produts,produts_disponibilidade:=produts\/{id_produto|->produto},produts_disponibilidade\/{id_produto|->produto'qtd} [] not(id_produto/:dom(produts)) ==> produts,produts_disponibilidade:=produts<+{id_produto|->rec(qtd>>produts(id_produto)'qtd+produto'qtd,valor>>produto'valor)},produts_disponibilidade<+{id_produto|->produts_disponibilidade(id_produto)+produto'qtd});
  Expanded_List_Substitution(Machine(Rialuecho),dropar_carrinho)==(xx: num_carrinho & xx: carrinhos & xx: dom(produtos_por_carrinho) & {prod | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts_disponibilidade) & prod = id_prod|->produts_disponibilidade(id_prod)+produtos_por_carrinho(xx)(id_prod)'qtd)}: ids_produto +-> NAT | produts_disponibilidade,produtos_por_carrinho,carrinhos:=produts_disponibilidade<+{prod | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts_disponibilidade) & prod = id_prod|->produts_disponibilidade(id_prod)+produtos_por_carrinho(xx)(id_prod)'qtd)},{xx}<<|produtos_por_carrinho,carrinhos-{xx});
  Expanded_List_Substitution(Machine(Rialuecho),adicionar_carrinho)==(xx: num_carrinho & xx/:carrinhos | carrinhos,produtos_por_carrinho:=carrinhos\/{xx},produtos_por_carrinho\/{xx|->{}});
  List_Substitution(Machine(Rialuecho),adicionar_carrinho)==(carrinhos:=carrinhos\/{xx} || produtos_por_carrinho:=produtos_por_carrinho\/{xx|->{}});
  List_Substitution(Machine(Rialuecho),dropar_carrinho)==(produts_disponibilidade:=produts_disponibilidade<+{prod | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts_disponibilidade) & prod = id_prod|->produts_disponibilidade(id_prod)+produtos_por_carrinho(xx)(id_prod)'qtd)} || produtos_por_carrinho:={xx}<<|produtos_por_carrinho || carrinhos:=carrinhos-{xx});
  List_Substitution(Machine(Rialuecho),adicionar_produto)==(IF id_produto/:dom(produts) THEN produts:=produts\/{id_produto|->produto} || produts_disponibilidade:=produts_disponibilidade\/{id_produto|->produto'qtd} ELSE produts:=produts<+{id_produto|->rec(qtd>>produts(id_produto)'qtd+produto'qtd,valor>>produto'valor)} || produts_disponibilidade:=produts_disponibilidade<+{id_produto|->produts_disponibilidade(id_produto)+produto'qtd} END);
  List_Substitution(Machine(Rialuecho),remover_produto)==(produts:=produts<+{id_produto|->rec(qtd>>produts(id_produto)'qtd-qtd,valor>>produts(id_produto)'valor)} || produts_disponibilidade:=produts_disponibilidade<+{id_produto|->produts_disponibilidade(id_produto)-qtd});
  List_Substitution(Machine(Rialuecho),adicionar_produto_ao_carrinho)==(produts_disponibilidade:=produts_disponibilidade<+{nome|->produts_disponibilidade(nome)-qtd} || IF nome: dom(produtos_por_carrinho(xx)) THEN produtos_por_carrinho:=produtos_por_carrinho<+{xx|->(produtos_por_carrinho(xx)<+{nome|->rec(qtd>>produtos_por_carrinho(xx)(nome)'qtd+qtd)})} ELSE produtos_por_carrinho:=produtos_por_carrinho<+{xx|->(produtos_por_carrinho(xx)\/{nome|->rec(qtd>>qtd)})} END);
  List_Substitution(Machine(Rialuecho),remover_produto_do_carrinho)==(produts_disponibilidade:=produts_disponibilidade<+{id_prod|->produts_disponibilidade(id_prod)+produtos_por_carrinho(xx)(id_prod)'qtd} || produtos_por_carrinho:=produtos_por_carrinho<+{xx|->produtos_por_carrinho(xx)-{id_prod|->rec(qtd>>produtos_por_carrinho(xx)(id_prod)'qtd)}});
  List_Substitution(Machine(Rialuecho),comprar)==(ANY aa WHERE aa: seq(struct(id_prod>>ids_produto,qtd>>NAT,valor>>NAT)) & {compra | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts) & compra = rec(id_prod>>id_prod,qtd>>produtos_por_carrinho(xx)(id_prod)'qtd,valor>>produts(id_prod)'valor))}: FIN({compra | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts) & compra = rec(id_prod>>id_prod,qtd>>produtos_por_carrinho(xx)(id_prod)'qtd,valor>>produts(id_prod)'valor))}) & aa: perm({compra | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts) & compra = rec(id_prod>>id_prod,qtd>>produtos_por_carrinho(xx)(id_prod)'qtd,valor>>produts(id_prod)'valor))}) THEN historico_compra:=historico_compra^aa END || produts:=produts<+{prod | #id_prod.(id_prod: dom(produtos_por_carrinho(xx)) & id_prod: dom(produts) & prod = id_prod|->rec(qtd>>produts(id_prod)'qtd-produtos_por_carrinho(xx)(id_prod)'qtd,valor>>produts(id_prod)'valor))} || produtos_por_carrinho:={xx}<<|produtos_por_carrinho || carrinhos:=carrinhos-{xx});
  List_Substitution(Machine(Rialuecho),relatorio_dia)==(lucro_dia:={SIGMA(xx).(xx: ran(historico_compra) | xx'qtd*xx'valor*card(historico_compra|>{xx}))} || rd:=lucro_dia)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Rialuecho))==(?);
  Inherited_List_Constants(Machine(Rialuecho))==(?);
  List_Constants(Machine(Rialuecho))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Rialuecho),ids_produto)==({ids_produto0,ids_produto1,ids_produto2,ids_produto3,ids_produto4});
  Context_List_Enumerated(Machine(Rialuecho))==(num_carrinho,ids_produto);
  Context_List_Defered(Machine(Rialuecho))==(?);
  Context_List_Sets(Machine(Rialuecho))==(num_carrinho,ids_produto);
  List_Valuable_Sets(Machine(Rialuecho))==(?);
  Inherited_List_Enumerated(Machine(Rialuecho))==(?);
  Inherited_List_Defered(Machine(Rialuecho))==(?);
  Inherited_List_Sets(Machine(Rialuecho))==(?);
  List_Enumerated(Machine(Rialuecho))==(?);
  List_Defered(Machine(Rialuecho))==(?);
  List_Sets(Machine(Rialuecho))==(?);
  Set_Definition(Machine(Rialuecho),num_carrinho)==({num_carrinho0,num_carrinho1,num_carrinho2,num_carrinho3,num_carrinho4})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Rialuecho))==(?);
  Expanded_List_HiddenConstants(Machine(Rialuecho))==(?);
  List_HiddenConstants(Machine(Rialuecho))==(?);
  External_List_HiddenConstants(Machine(Rialuecho))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Rialuecho))==(btrue);
  Context_List_Properties(Machine(Rialuecho))==(num_carrinho: FIN(INTEGER) & not(num_carrinho = {}) & ids_produto: FIN(INTEGER) & not(ids_produto = {}));
  Inherited_List_Properties(Machine(Rialuecho))==(btrue);
  List_Properties(Machine(Rialuecho))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Rialuecho),Machine(Rialuecho_ctx))==(?);
  Seen_Context_List_Enumerated(Machine(Rialuecho))==(?);
  Seen_Context_List_Invariant(Machine(Rialuecho))==(btrue);
  Seen_Context_List_Assertions(Machine(Rialuecho))==(btrue);
  Seen_Context_List_Properties(Machine(Rialuecho))==(btrue);
  Seen_List_Constraints(Machine(Rialuecho))==(btrue);
  Seen_List_Operations(Machine(Rialuecho),Machine(Rialuecho_ctx))==(?);
  Seen_Expanded_List_Invariant(Machine(Rialuecho),Machine(Rialuecho_ctx))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Rialuecho),adicionar_carrinho)==(?);
  List_ANY_Var(Machine(Rialuecho),dropar_carrinho)==(?);
  List_ANY_Var(Machine(Rialuecho),adicionar_produto)==(?);
  List_ANY_Var(Machine(Rialuecho),remover_produto)==(?);
  List_ANY_Var(Machine(Rialuecho),adicionar_produto_ao_carrinho)==(?);
  List_ANY_Var(Machine(Rialuecho),remover_produto_do_carrinho)==(?);
  List_ANY_Var(Machine(Rialuecho),comprar)==(Var(aa) == SetOf(btype(INTEGER,?,?)*rtype(((id_prod: etype(ids_produto,?,?)),qtd: btype(INTEGER,?,?)),valor: btype(INTEGER,?,?))));
  List_ANY_Var(Machine(Rialuecho),relatorio_dia)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Rialuecho)) == (? | ? | lucro_dia,historico_compra,produts_disponibilidade,produts,produtos_por_carrinho,carrinhos | ? | adicionar_carrinho,dropar_carrinho,adicionar_produto,remover_produto,adicionar_produto_ao_carrinho,remover_produto_do_carrinho,comprar,relatorio_dia | ? | seen(Machine(Rialuecho_ctx)) | ? | Rialuecho);
  List_Of_HiddenCst_Ids(Machine(Rialuecho)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Rialuecho)) == (?);
  List_Of_VisibleVar_Ids(Machine(Rialuecho)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Rialuecho)) == (?: ?);
  List_Of_Ids(Machine(Rialuecho_ctx)) == (num_carrinho,ids_produto,num_carrinho0,num_carrinho1,num_carrinho2,num_carrinho3,num_carrinho4,ids_produto0,ids_produto1,ids_produto2,ids_produto3,ids_produto4 | ? | ? | ? | ? | ? | ? | ? | Rialuecho_ctx);
  List_Of_HiddenCst_Ids(Machine(Rialuecho_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Rialuecho_ctx)) == (?);
  List_Of_VisibleVar_Ids(Machine(Rialuecho_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Rialuecho_ctx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Rialuecho)) == (Type(lucro_dia) == Mvl(SetOf(btype(INTEGER,?,?)));Type(historico_compra) == Mvl(SetOf(btype(INTEGER,?,?)*rtype(((id_prod: etype(ids_produto,?,?)),qtd: btype(INTEGER,?,?)),valor: btype(INTEGER,?,?))));Type(produts_disponibilidade) == Mvl(SetOf(etype(ids_produto,?,?)*btype(INTEGER,?,?)));Type(produts) == Mvl(SetOf(etype(ids_produto,?,?)*rtype((qtd: btype(INTEGER,?,?)),valor: btype(INTEGER,?,?))));Type(produtos_por_carrinho) == Mvl(SetOf(etype(num_carrinho,?,?)*SetOf(etype(ids_produto,?,?)*rtype(qtd: btype(INTEGER,?,?)))));Type(carrinhos) == Mvl(SetOf(etype(num_carrinho,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Rialuecho)) == (Type(relatorio_dia) == Cst(SetOf(btype(INTEGER,?,?)),No_type);Type(comprar) == Cst(No_type,etype(num_carrinho,?,?));Type(remover_produto_do_carrinho) == Cst(No_type,etype(ids_produto,?,?)*etype(num_carrinho,?,?));Type(adicionar_produto_ao_carrinho) == Cst(No_type,etype(ids_produto,?,?)*etype(num_carrinho,?,?)*btype(INTEGER,?,?));Type(remover_produto) == Cst(No_type,etype(ids_produto,?,?)*btype(INTEGER,?,?));Type(adicionar_produto) == Cst(No_type,etype(ids_produto,?,?)*rtype((qtd: btype(INTEGER,0,MAXINT)),valor: btype(INTEGER,0,MAXINT)));Type(dropar_carrinho) == Cst(No_type,etype(num_carrinho,?,?));Type(adicionar_carrinho) == Cst(No_type,etype(num_carrinho,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
