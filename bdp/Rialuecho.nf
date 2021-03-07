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
  Local_List_Variables(Machine(Rialuecho))==(lista_produtos,carrinhos);
  List_Variables(Machine(Rialuecho))==(lista_produtos,carrinhos);
  External_List_Variables(Machine(Rialuecho))==(lista_produtos,carrinhos)
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
  List_Invariant(Machine(Rialuecho))==(carrinhos: POW(num_carrinho) & lista_produtos: num_carrinho +-> POW(produto))
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
  Expanded_List_Initialisation(Machine(Rialuecho))==(carrinhos,lista_produtos:={},{});
  Context_List_Initialisation(Machine(Rialuecho))==(skip);
  List_Initialisation(Machine(Rialuecho))==(carrinhos:={} || lista_produtos:={})
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
  Internal_List_Operations(Machine(Rialuecho))==(adicionar_carrinho,dropar_carrinho,adicionar_produto,remover_produto);
  List_Operations(Machine(Rialuecho))==(adicionar_carrinho,dropar_carrinho,adicionar_produto,remover_produto)
END
&
THEORY ListInputX IS
  List_Input(Machine(Rialuecho),adicionar_carrinho)==(xx);
  List_Input(Machine(Rialuecho),dropar_carrinho)==(xx);
  List_Input(Machine(Rialuecho),adicionar_produto)==(prod,xx);
  List_Input(Machine(Rialuecho),remover_produto)==(prod,xx)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Rialuecho),adicionar_carrinho)==(?);
  List_Output(Machine(Rialuecho),dropar_carrinho)==(?);
  List_Output(Machine(Rialuecho),adicionar_produto)==(?);
  List_Output(Machine(Rialuecho),remover_produto)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Rialuecho),adicionar_carrinho)==(adicionar_carrinho(xx));
  List_Header(Machine(Rialuecho),dropar_carrinho)==(dropar_carrinho(xx));
  List_Header(Machine(Rialuecho),adicionar_produto)==(adicionar_produto(prod,xx));
  List_Header(Machine(Rialuecho),remover_produto)==(remover_produto(prod,xx))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Rialuecho),adicionar_carrinho)==(xx: num_carrinho & xx/:carrinhos);
  List_Precondition(Machine(Rialuecho),dropar_carrinho)==(xx: num_carrinho & xx: carrinhos);
  List_Precondition(Machine(Rialuecho),adicionar_produto)==(prod: produto & xx: num_carrinho & xx: carrinhos & prod/:lista_produtos(xx));
  List_Precondition(Machine(Rialuecho),remover_produto)==(prod: produto & xx: num_carrinho & xx: carrinhos & prod: lista_produtos(xx))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Rialuecho),remover_produto)==(prod: produto & xx: num_carrinho & xx: carrinhos & prod: lista_produtos(xx) | lista_produtos:=lista_produtos<+{xx|->lista_produtos(xx)-{prod}});
  Expanded_List_Substitution(Machine(Rialuecho),adicionar_produto)==(prod: produto & xx: num_carrinho & xx: carrinhos & prod/:lista_produtos(xx) | lista_produtos:=lista_produtos<+{xx|->(lista_produtos(xx)\/{prod})});
  Expanded_List_Substitution(Machine(Rialuecho),dropar_carrinho)==(xx: num_carrinho & xx: carrinhos | lista_produtos,carrinhos:={xx}<<|lista_produtos,carrinhos-{xx});
  Expanded_List_Substitution(Machine(Rialuecho),adicionar_carrinho)==(xx: num_carrinho & xx/:carrinhos | carrinhos,lista_produtos:=carrinhos\/{xx},lista_produtos\/{xx|->{}});
  List_Substitution(Machine(Rialuecho),adicionar_carrinho)==(carrinhos:=carrinhos\/{xx} || lista_produtos:=lista_produtos\/{xx|->{}});
  List_Substitution(Machine(Rialuecho),dropar_carrinho)==(lista_produtos:={xx}<<|lista_produtos || carrinhos:=carrinhos-{xx});
  List_Substitution(Machine(Rialuecho),adicionar_produto)==(lista_produtos:=lista_produtos<+{xx|->(lista_produtos(xx)\/{prod})});
  List_Substitution(Machine(Rialuecho),remover_produto)==(lista_produtos:=lista_produtos<+{xx|->lista_produtos(xx)-{prod}})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Rialuecho))==(?);
  Inherited_List_Constants(Machine(Rialuecho))==(?);
  List_Constants(Machine(Rialuecho))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Rialuecho))==(?);
  Context_List_Defered(Machine(Rialuecho))==(num_carrinho,produto);
  Context_List_Sets(Machine(Rialuecho))==(num_carrinho,produto);
  List_Valuable_Sets(Machine(Rialuecho))==(?);
  Inherited_List_Enumerated(Machine(Rialuecho))==(?);
  Inherited_List_Defered(Machine(Rialuecho))==(?);
  Inherited_List_Sets(Machine(Rialuecho))==(?);
  List_Enumerated(Machine(Rialuecho))==(?);
  List_Defered(Machine(Rialuecho))==(?);
  List_Sets(Machine(Rialuecho))==(?)
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
  Context_List_Properties(Machine(Rialuecho))==(num_carrinho: FIN(INTEGER) & not(num_carrinho = {}) & produto: FIN(INTEGER) & not(produto = {}));
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
  List_ANY_Var(Machine(Rialuecho),remover_produto)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Rialuecho)) == (? | ? | lista_produtos,carrinhos | ? | adicionar_carrinho,dropar_carrinho,adicionar_produto,remover_produto | ? | seen(Machine(Rialuecho_ctx)) | ? | Rialuecho);
  List_Of_HiddenCst_Ids(Machine(Rialuecho)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Rialuecho)) == (?);
  List_Of_VisibleVar_Ids(Machine(Rialuecho)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Rialuecho)) == (?: ?);
  List_Of_Ids(Machine(Rialuecho_ctx)) == (num_carrinho,produto | ? | ? | ? | ? | ? | ? | ? | Rialuecho_ctx);
  List_Of_HiddenCst_Ids(Machine(Rialuecho_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Rialuecho_ctx)) == (?);
  List_Of_VisibleVar_Ids(Machine(Rialuecho_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Rialuecho_ctx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Rialuecho)) == (Type(lista_produtos) == Mvl(SetOf(atype(num_carrinho,?,?)*SetOf(atype(produto,?,?))));Type(carrinhos) == Mvl(SetOf(atype(num_carrinho,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Rialuecho)) == (Type(remover_produto) == Cst(No_type,atype(produto,?,?)*atype(num_carrinho,?,?));Type(adicionar_produto) == Cst(No_type,atype(produto,?,?)*atype(num_carrinho,?,?));Type(dropar_carrinho) == Cst(No_type,atype(num_carrinho,?,?));Type(adicionar_carrinho) == Cst(No_type,atype(num_carrinho,?,?)))
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
