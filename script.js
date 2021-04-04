bms.observe("formula", {
  selector: ".produtos_camisa",
  formulas: ["produts_disponibilidade"],
  trigger: function(origin, values) {

    var valor = values[0].replace( "{(ids_produto2|->","").replace(")}");

    var count_produt = parseInt(valor);
    var id_produto = origin.attr("id").replace("produto_","");
    if( parseInt(id_produto) <= count_produt ){
        origin.css("visibility", "visible");
    }else{
        origin.css("visibility", "hidden");

    }
    
  }
});

bms.observe("formula", {
    selector: ".produtos_camisa_carrinho",
    formulas: ["produtos_por_carrinho"],
    trigger: function(origin, values) {
  
      var valor = values[0].replace( "{(num_carrinho1|->{(ids_produto2|->rec(qtd:","").replace("))})}");
  
      var count_produt = parseInt(valor);
      var id_produto = origin.attr("id").replace("produto_carrinho_","");
      if( parseInt(id_produto) <= count_produt ){
          origin.css("visibility", "visible");
      }else{
          origin.css("visibility", "hidden");
  
      }
      
    }
  });

bms.observe("formula", {
    selector: "#button_texto_relatorio",
    formulas: ["lucro_dia"],
    trigger: function(origin, values) {

        const regex = /{|}/g;
        var valor = values[0].replace(regex,"");
        origin.text("O lucro do dia esta em: " + valor);
        
    }
});

bms.observe("formula", {
  selector: "#imagem_carrinho",
  formulas: ["carrinhos"],
  trigger: function(origin, values) {

    if(values[0] == "{}"){
      origin.css("visibility", "hidden");
    }else{
      origin.css("visibility", "visible");
    }

  }
});

bms.executeEvent({
    selector: "#button_adicionar_carrinho",
    events: [
      { name: "adicionar_carrinho",
        predicate: "xx=num_carrinho1"
     }
    ]
});

bms.executeEvent({
    selector: "#button_remover_carrinho",
    events: [
      { name: "dropar_carrinho",
      predicate: "xx=num_carrinho1"
     }
    ]
});

bms.executeEvent({
    selector: "#button_adicionar_produto",
    events: [
      { name: "adicionar_produto",
        predicate: "id_produto=ids_produto"+ 2 +"&produto=rec(qtd:"+ 1 +", valor:"+ 3 +") "
     }
    ]
});

bms.executeEvent({
    selector: "#button_remover_produto",
    events: [
      { name: "remover_produto",
        predicate: "id_produto=ids_produto2"
     }
    ]
});

bms.executeEvent({
    selector: "#button_produto_carrinho",
    events: [
      { name: "adicionar_produto_ao_carrinho",
        predicate: "nome=ids_produto2&xx=num_carrinho1"
     }
    ]
});

bms.executeEvent({
    selector: "#button_produto_carrinho_remover",
    events: [
      { name: "remover_produto_do_carrinho",
      predicate: "id_prod=ids_produto2&xx=num_carrinho1"
     }
    ]
});

bms.executeEvent({
    selector: "#button_compra",
    events: [
      { name: "comprar",
      predicate: "xx=num_carrinho1"
     }
    ]
});

bms.executeEvent({
    selector: "#button_texto_relatorio",
    events: [
      { name: "relatorio_dia"
     }
    ]
});

