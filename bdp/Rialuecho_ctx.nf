Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Rialuecho_ctx))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Rialuecho_ctx))==(Machine(Rialuecho_ctx));
  Level(Machine(Rialuecho_ctx))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Rialuecho_ctx)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Rialuecho_ctx))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Rialuecho_ctx))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Rialuecho_ctx))==(?);
  List_Includes(Machine(Rialuecho_ctx))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Rialuecho_ctx))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Rialuecho_ctx))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Rialuecho_ctx))==(?);
  Context_List_Variables(Machine(Rialuecho_ctx))==(?);
  Abstract_List_Variables(Machine(Rialuecho_ctx))==(?);
  Local_List_Variables(Machine(Rialuecho_ctx))==(?);
  List_Variables(Machine(Rialuecho_ctx))==(?);
  External_List_Variables(Machine(Rialuecho_ctx))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Rialuecho_ctx))==(?);
  Abstract_List_VisibleVariables(Machine(Rialuecho_ctx))==(?);
  External_List_VisibleVariables(Machine(Rialuecho_ctx))==(?);
  Expanded_List_VisibleVariables(Machine(Rialuecho_ctx))==(?);
  List_VisibleVariables(Machine(Rialuecho_ctx))==(?);
  Internal_List_VisibleVariables(Machine(Rialuecho_ctx))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Rialuecho_ctx))==(btrue);
  Gluing_List_Invariant(Machine(Rialuecho_ctx))==(btrue);
  Expanded_List_Invariant(Machine(Rialuecho_ctx))==(btrue);
  Abstract_List_Invariant(Machine(Rialuecho_ctx))==(btrue);
  Context_List_Invariant(Machine(Rialuecho_ctx))==(btrue);
  List_Invariant(Machine(Rialuecho_ctx))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Rialuecho_ctx))==(btrue);
  Abstract_List_Assertions(Machine(Rialuecho_ctx))==(btrue);
  Context_List_Assertions(Machine(Rialuecho_ctx))==(btrue);
  List_Assertions(Machine(Rialuecho_ctx))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Rialuecho_ctx))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Rialuecho_ctx))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Rialuecho_ctx))==(skip);
  Context_List_Initialisation(Machine(Rialuecho_ctx))==(skip);
  List_Initialisation(Machine(Rialuecho_ctx))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Rialuecho_ctx))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Rialuecho_ctx))==(btrue);
  List_Constraints(Machine(Rialuecho_ctx))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Rialuecho_ctx))==(?);
  List_Operations(Machine(Rialuecho_ctx))==(?)
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
  List_Valuable_Constants(Machine(Rialuecho_ctx))==(?);
  Inherited_List_Constants(Machine(Rialuecho_ctx))==(?);
  List_Constants(Machine(Rialuecho_ctx))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Rialuecho_ctx),num_carrinho)==(?);
  Context_List_Enumerated(Machine(Rialuecho_ctx))==(?);
  Context_List_Defered(Machine(Rialuecho_ctx))==(?);
  Context_List_Sets(Machine(Rialuecho_ctx))==(?);
  List_Valuable_Sets(Machine(Rialuecho_ctx))==(num_carrinho,ids_produto);
  Inherited_List_Enumerated(Machine(Rialuecho_ctx))==(?);
  Inherited_List_Defered(Machine(Rialuecho_ctx))==(?);
  Inherited_List_Sets(Machine(Rialuecho_ctx))==(?);
  List_Enumerated(Machine(Rialuecho_ctx))==(?);
  List_Defered(Machine(Rialuecho_ctx))==(num_carrinho,ids_produto);
  List_Sets(Machine(Rialuecho_ctx))==(num_carrinho,ids_produto);
  Set_Definition(Machine(Rialuecho_ctx),ids_produto)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Rialuecho_ctx))==(?);
  Expanded_List_HiddenConstants(Machine(Rialuecho_ctx))==(?);
  List_HiddenConstants(Machine(Rialuecho_ctx))==(?);
  External_List_HiddenConstants(Machine(Rialuecho_ctx))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Rialuecho_ctx))==(btrue);
  Context_List_Properties(Machine(Rialuecho_ctx))==(btrue);
  Inherited_List_Properties(Machine(Rialuecho_ctx))==(btrue);
  List_Properties(Machine(Rialuecho_ctx))==(num_carrinho: FIN(INTEGER) & not(num_carrinho = {}) & ids_produto: FIN(INTEGER) & not(ids_produto = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Rialuecho_ctx)) == (num_carrinho,ids_produto | ? | ? | ? | ? | ? | ? | ? | Rialuecho_ctx);
  List_Of_HiddenCst_Ids(Machine(Rialuecho_ctx)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Rialuecho_ctx)) == (?);
  List_Of_VisibleVar_Ids(Machine(Rialuecho_ctx)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Rialuecho_ctx)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Rialuecho_ctx)) == (Type(num_carrinho) == Cst(SetOf(atype(num_carrinho,"[num_carrinho","]num_carrinho")));Type(ids_produto) == Cst(SetOf(atype(ids_produto,"[ids_produto","]ids_produto"))))
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
