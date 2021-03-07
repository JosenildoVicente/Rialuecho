Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Rialuecho_ctx_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Rialuecho_ctx_i))==(Machine(Rialuecho_ctx));
  Level(Implementation(Rialuecho_ctx_i))==(1);
  Upper_Level(Implementation(Rialuecho_ctx_i))==(Machine(Rialuecho_ctx))
END
&
THEORY LoadedStructureX IS
  Implementation(Rialuecho_ctx_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Rialuecho_ctx_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Rialuecho_ctx_i))==(?);
  Inherited_List_Includes(Implementation(Rialuecho_ctx_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Rialuecho_ctx_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Rialuecho_ctx_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Rialuecho_ctx_i))==(?);
  Context_List_Variables(Implementation(Rialuecho_ctx_i))==(?);
  Abstract_List_Variables(Implementation(Rialuecho_ctx_i))==(?);
  Local_List_Variables(Implementation(Rialuecho_ctx_i))==(?);
  List_Variables(Implementation(Rialuecho_ctx_i))==(?);
  External_List_Variables(Implementation(Rialuecho_ctx_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Rialuecho_ctx_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Rialuecho_ctx_i))==(?);
  External_List_VisibleVariables(Implementation(Rialuecho_ctx_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Rialuecho_ctx_i))==(?);
  List_VisibleVariables(Implementation(Rialuecho_ctx_i))==(?);
  Internal_List_VisibleVariables(Implementation(Rialuecho_ctx_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Rialuecho_ctx_i))==(btrue);
  Expanded_List_Invariant(Implementation(Rialuecho_ctx_i))==(btrue);
  Abstract_List_Invariant(Implementation(Rialuecho_ctx_i))==(btrue);
  Context_List_Invariant(Implementation(Rialuecho_ctx_i))==(btrue);
  List_Invariant(Implementation(Rialuecho_ctx_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(Rialuecho_ctx_i))==(btrue);
  Abstract_List_Assertions(Implementation(Rialuecho_ctx_i))==(btrue);
  Context_List_Assertions(Implementation(Rialuecho_ctx_i))==(btrue);
  List_Assertions(Implementation(Rialuecho_ctx_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Rialuecho_ctx_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Rialuecho_ctx_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Rialuecho_ctx_i))==(skip);
  Context_List_Initialisation(Implementation(Rialuecho_ctx_i))==(skip);
  List_Initialisation(Implementation(Rialuecho_ctx_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Rialuecho_ctx_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Rialuecho_ctx_i))==(btrue);
  List_Context_Constraints(Implementation(Rialuecho_ctx_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Rialuecho_ctx_i))==(?);
  List_Operations(Implementation(Rialuecho_ctx_i))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Rialuecho_ctx_i))==(?);
  Inherited_List_Constants(Implementation(Rialuecho_ctx_i))==(?);
  List_Constants(Implementation(Rialuecho_ctx_i))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Implementation(Rialuecho_ctx_i),produto)==(?);
  Context_List_Enumerated(Implementation(Rialuecho_ctx_i))==(?);
  Context_List_Defered(Implementation(Rialuecho_ctx_i))==(?);
  Context_List_Sets(Implementation(Rialuecho_ctx_i))==(?);
  List_Own_Enumerated(Implementation(Rialuecho_ctx_i))==(?);
  List_Valuable_Sets(Implementation(Rialuecho_ctx_i))==(num_carrinho,produto);
  Inherited_List_Enumerated(Implementation(Rialuecho_ctx_i))==(?);
  Inherited_List_Defered(Implementation(Rialuecho_ctx_i))==(num_carrinho,produto);
  Inherited_List_Sets(Implementation(Rialuecho_ctx_i))==(num_carrinho,produto);
  List_Enumerated(Implementation(Rialuecho_ctx_i))==(?);
  List_Defered(Implementation(Rialuecho_ctx_i))==(?);
  List_Sets(Implementation(Rialuecho_ctx_i))==(?);
  Set_Definition(Implementation(Rialuecho_ctx_i),num_carrinho)==(?)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Rialuecho_ctx_i))==(?);
  Expanded_List_HiddenConstants(Implementation(Rialuecho_ctx_i))==(?);
  List_HiddenConstants(Implementation(Rialuecho_ctx_i))==(?);
  External_List_HiddenConstants(Implementation(Rialuecho_ctx_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Rialuecho_ctx_i))==(num_carrinho: FIN(INTEGER) & not(num_carrinho = {}) & produto: FIN(INTEGER) & not(produto = {}));
  Context_List_Properties(Implementation(Rialuecho_ctx_i))==(btrue);
  Inherited_List_Properties(Implementation(Rialuecho_ctx_i))==(btrue);
  List_Properties(Implementation(Rialuecho_ctx_i))==(btrue)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(Rialuecho_ctx_i))==(btrue);
  Values_Subs(Implementation(Rialuecho_ctx_i))==(num_carrinho,produto: {1,2,3,4,5,6,7,8,9,10},{10,15,20,14,17,13,1,7,6,8,3,4,18,20,50});
  List_Values(Implementation(Rialuecho_ctx_i))==(num_carrinho = {1,2,3,4,5,6,7,8,9,10};produto = {10,15,20,14,17,13,1,7,6,8,3,4,18,20,50})
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Rialuecho_ctx_i)) == (? | ? | ? | ? | ? | ? | ? | ? | Rialuecho_ctx_i);
  List_Of_HiddenCst_Ids(Implementation(Rialuecho_ctx_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Rialuecho_ctx_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Rialuecho_ctx_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(Rialuecho_ctx_i)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Implementation(Rialuecho_ctx_i)) == (Type(produto) == Cst(SetOf(btype(INTEGER,"[produto","]produto")));Type(num_carrinho) == Cst(SetOf(btype(INTEGER,"[num_carrinho","]num_carrinho"))))
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
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(Rialuecho_ctx_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(Rialuecho_ctx_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
