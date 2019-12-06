Dado("que eu fechei o pedido com os itens:") do |tabelaProdutos|
    @produtos_lista = tabelaProdutos.hashes
    steps %{
        Quando eu adiciono todos os itens no carrinho
    }
    @restaurantePage.cart.fecharCarrinho
end
  
Dado("informei os meus dados de entrega:") do |dadosEntrega|
    usuario = dadosEntrega.rows_hash
    @orderPage.dadosUsuario(usuario)
end
  
Quando("eu finalizo o pedido com {string}") do |formaPagamento|
    @orderPage.finalizarPedido(formaPagamento)
end
  
Então("devo ver a seguinte mensagem:") do |msg|
    expect(@orderPage.msgConclusao).to have_text msg
end