Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Compra_ctx))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Compra_ctx))==(Machine(Compra_ctx));
  Level(Machine(Compra_ctx))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Compra_ctx)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Compra_ctx))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Compra_ctx))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Compra_ctx))==(?);
  List_Includes(Machine(Compra_ctx))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Compra_ctx))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Compra_ctx))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Compra_ctx))==(?);
  Context_List_Variables(Machine(Compra_ctx))==(?);
  Abstract_List_Variables(Machine(Compra_ctx))==(?);
  Local_List_Variables(Machine(Compra_ctx))==(?);
  List_Variables(Machine(Compra_ctx))==(?);
  External_List_Variables(Machine(Compra_ctx))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Compra_ctx))==(?);
  Abstract_List_VisibleVariables(Machine(Compra_ctx))==(?);
  External_List_VisibleVariables(Machine(Compra_ctx))==(?);
  Expanded_List_VisibleVariables(Machine(Compra_ctx))==(?);
  List_VisibleVariables(Machine(Compra_ctx))==(?);
  Internal_List_VisibleVariables(Machine(Compra_ctx))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Compra_ctx))==(btrue);
  Gluing_List_Invariant(Machine(Compra_ctx))==(btrue);
  Expanded_List_Invariant(Machine(Compra_ctx))==(btrue);
  Abstract_List_Invariant(Machine(Compra_ctx))==(btrue);
  Context_List_Invariant(Machine(Compra_ctx))==(btrue);
  List_Invariant(Machine(Compra_ctx))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Compra_ctx))==(btrue);
  Abstract_List_Assertions(Machine(Compra_ctx))==(btrue);
  Context_List_Assertions(Machine(Compra_ctx))==(btrue);
  List_Assertions(Machine(Compra_ctx))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Compra_ctx))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Compra_ctx))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Compra_ctx))==(skip);
  Context_List_Initialisation(Machine(Compra_ctx))==(skip);
  List_Initialisation(Machine(Compra_ctx))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Compra_ctx))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Compra_ctx))==(btrue);
  List_Constraints(Machine(Compra_ctx))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Compra_ctx))==(?);
  List_Operations(Machine(Compra_ctx))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Compra_ctx))==(?);
  Inherited_List_Constants(Machine(Compra_ctx))==(?);
  List_Constants(Machine(Compra_ctx))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Compra_ctx),estados_da_compra)==(?);
  Context_List_Enumerated(Machine(Compra_ctx))==(?);
  Context_List_Defered(Machine(Compra_ctx))==(?);
  Context_List_Sets(Machine(Compra_ctx))==(?);
  List_Valuable_Sets(Machine(Compra_ctx))==(estados_da_compra,metodos_de_pagamento);
  Inherited_List_Enumerated(Machine(Compra_ctx))==(?);
  Inherited_List_Defered(Machine(Compra_ctx))==(?);
  Inherited_List_Sets(Machine(Compra_ctx))==(?);
  List_Enumerated(Machine(Compra_ctx))==(?);
  List_Defered(Machine(Compra_ctx))==(estados_da_compra,metodos_de_pagamento);
  List_Sets(Machine(Compra_ctx))==(estados_da_compra,metodos_de_pagamento);
  Set_Definition(Machine(Compra_ctx),metodos_de_pagamento)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Compra_ctx))==(?);
  Expanded_List_HiddenConstants(Machine(Compra_ctx))==(?);
  List_HiddenConstants(Machine(Compra_ctx))==(?);
  External_List_HiddenConstants(Machine(Compra_ctx))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Compra_ctx))==(btrue);
  Context_List_Properties(Machine(Compra_ctx))==(btrue);
  Inherited_List_Properties(Machine(Compra_ctx))==(btrue);
  List_Properties(Machine(Compra_ctx))==(estados_da_compra: FIN(INTEGER) & not(estados_da_compra = {}) & metodos_de_pagamento: FIN(INTEGER) & not(metodos_de_pagamento = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Compra_ctx)) == (estados_da_compra,metodos_de_pagamento | ? | ? | ? | ? | ? | ? | ? | Compra_ctx);
  List_Of_HiddenCst_Ids(Machine(Compra_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Compra_ctx)) == (?);
  List_Of_VisibleVar_Ids(Machine(Compra_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Compra_ctx)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Compra_ctx)) == (Type(estados_da_compra) == Cst(SetOf(atype(estados_da_compra,"[estados_da_compra","]estados_da_compra")));Type(metodos_de_pagamento) == Cst(SetOf(atype(metodos_de_pagamento,"[metodos_de_pagamento","]metodos_de_pagamento"))))
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
