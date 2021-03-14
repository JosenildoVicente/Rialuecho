Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Compra))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Compra))==(Machine(Compra));
  Level(Machine(Compra))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Compra)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Compra))==(Compra_ctx)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Compra))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Compra))==(?);
  List_Includes(Machine(Compra))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Compra))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Compra))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Compra))==(?);
  Context_List_Variables(Machine(Compra))==(?);
  Abstract_List_Variables(Machine(Compra))==(?);
  Local_List_Variables(Machine(Compra))==(estado_da_compra);
  List_Variables(Machine(Compra))==(estado_da_compra);
  External_List_Variables(Machine(Compra))==(estado_da_compra)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Compra))==(?);
  Abstract_List_VisibleVariables(Machine(Compra))==(?);
  External_List_VisibleVariables(Machine(Compra))==(?);
  Expanded_List_VisibleVariables(Machine(Compra))==(?);
  List_VisibleVariables(Machine(Compra))==(?);
  Internal_List_VisibleVariables(Machine(Compra))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Compra))==(btrue);
  Gluing_List_Invariant(Machine(Compra))==(btrue);
  Expanded_List_Invariant(Machine(Compra))==(btrue);
  Abstract_List_Invariant(Machine(Compra))==(btrue);
  Context_List_Invariant(Machine(Compra))==(btrue);
  List_Invariant(Machine(Compra))==(estado_da_compra: estados_da_compra)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Compra))==(btrue);
  Abstract_List_Assertions(Machine(Compra))==(btrue);
  Context_List_Assertions(Machine(Compra))==(btrue);
  List_Assertions(Machine(Compra))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Compra))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Compra))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Compra))==(@estado.(estado: estados_da_compra ==> estado_da_compra:=estado));
  Context_List_Initialisation(Machine(Compra))==(skip);
  List_Initialisation(Machine(Compra))==(ANY estado WHERE estado: estados_da_compra THEN estado_da_compra:=estado END)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Compra))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Compra),Machine(Compra_ctx))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Compra))==(btrue);
  List_Constraints(Machine(Compra))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Compra))==(comprar);
  List_Operations(Machine(Compra))==(comprar)
END
&
THEORY ListInputX IS
  List_Input(Machine(Compra),comprar)==(metodo_de_pagamento)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Compra),comprar)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Compra),comprar)==(comprar(metodo_de_pagamento))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Compra),comprar)==(metodo_de_pagamento: metodos_de_pagamento)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Compra),comprar)==(metodo_de_pagamento: metodos_de_pagamento | @estado.(estado: estados_da_compra ==> estado_da_compra:=estado));
  List_Substitution(Machine(Compra),comprar)==(ANY estado WHERE estado: estados_da_compra THEN estado_da_compra:=estado END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Compra))==(?);
  Inherited_List_Constants(Machine(Compra))==(?);
  List_Constants(Machine(Compra))==(?)
END
&
THEORY ListSetsX IS
  Context_List_Enumerated(Machine(Compra))==(?);
  Context_List_Defered(Machine(Compra))==(estados_da_compra,metodos_de_pagamento);
  Context_List_Sets(Machine(Compra))==(estados_da_compra,metodos_de_pagamento);
  List_Valuable_Sets(Machine(Compra))==(?);
  Inherited_List_Enumerated(Machine(Compra))==(?);
  Inherited_List_Defered(Machine(Compra))==(?);
  Inherited_List_Sets(Machine(Compra))==(?);
  List_Enumerated(Machine(Compra))==(?);
  List_Defered(Machine(Compra))==(?);
  List_Sets(Machine(Compra))==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Compra))==(?);
  Expanded_List_HiddenConstants(Machine(Compra))==(?);
  List_HiddenConstants(Machine(Compra))==(?);
  External_List_HiddenConstants(Machine(Compra))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Compra))==(btrue);
  Context_List_Properties(Machine(Compra))==(estados_da_compra: FIN(INTEGER) & not(estados_da_compra = {}) & metodos_de_pagamento: FIN(INTEGER) & not(metodos_de_pagamento = {}));
  Inherited_List_Properties(Machine(Compra))==(btrue);
  List_Properties(Machine(Compra))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Compra),Machine(Compra_ctx))==(?);
  Seen_Context_List_Enumerated(Machine(Compra))==(?);
  Seen_Context_List_Invariant(Machine(Compra))==(btrue);
  Seen_Context_List_Assertions(Machine(Compra))==(btrue);
  Seen_Context_List_Properties(Machine(Compra))==(btrue);
  Seen_List_Constraints(Machine(Compra))==(btrue);
  Seen_List_Operations(Machine(Compra),Machine(Compra_ctx))==(?);
  Seen_Expanded_List_Invariant(Machine(Compra),Machine(Compra_ctx))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Compra),?)==(Var(estado) == atype(estados_da_compra,?,?));
  List_ANY_Var(Machine(Compra),comprar)==(Var(estado) == atype(estados_da_compra,?,?))
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Compra)) == (? | ? | estado_da_compra | ? | comprar | ? | seen(Machine(Compra_ctx)) | ? | Compra);
  List_Of_HiddenCst_Ids(Machine(Compra)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Compra)) == (?);
  List_Of_VisibleVar_Ids(Machine(Compra)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Compra)) == (?: ?);
  List_Of_Ids(Machine(Compra_ctx)) == (estados_da_compra,metodos_de_pagamento | ? | ? | ? | ? | ? | ? | ? | Compra_ctx);
  List_Of_HiddenCst_Ids(Machine(Compra_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Compra_ctx)) == (?);
  List_Of_VisibleVar_Ids(Machine(Compra_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Compra_ctx)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Compra)) == (Type(estado_da_compra) == Mvl(atype(estados_da_compra,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Compra)) == (Type(comprar) == Cst(No_type,atype(metodos_de_pagamento,?,?)))
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
