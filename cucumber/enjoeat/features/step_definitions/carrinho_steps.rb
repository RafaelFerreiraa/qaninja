# Adiciona produtos

Dado("que o produto desejado é {string}") do |produto|
    @produto_nome = produto
end

Dado("o valor do produto é de {string}") do |valor|
    produto_valor = valor
end

Quando("eu adiciono {int} unidade\\(s)") do |quantidade|
    quantidade.times do
        @restaurantePage.adicionaAoCarrinho(@produto_nome)
    end
end

Então("deve ser adicionada {int} unidade\\(s) deste item") do |quantidade|
    expect(@restaurantePage.cart.box).to have_text "(#{quantidade}x) #{@produto_nome}"
end

Então("o valor total deve ser de {string}") do |valor_total|
    expect(@restaurantePage.cart.total.text).to eql valor_total
end

# Lista de produtos

Dado("que os produtos desejados são:") do |table|
    @produtos_lista = table.hashes
end

Quando("eu adiciono todos os itens no carrinho") do
    @produtos_lista.each do |p|
        p['quantidade'].to_i.times do
            @restaurantePage.adicionaAoCarrinho(p['nome'])
        end
    end
end

Então("vejo todos os itens no carrinho") do
    @produtos_lista.each do |p|
        expect(@restaurantePage.cart.box).to have_text "(#{p['quantidade']}x) #{p['nome']}"
    end
end

# Remover produtos

Dado("que eu tenho os seguintes itens no carrinho:") do |table|
    @produtos_lista = table.hashes
    steps %{
        Quando eu adiciono todos os itens no carrinho
    }
end
  
Quando("eu removo o {int}") do |item|
    sleep 1
    @restaurantePage.cart.removeItem(item)
end
  
Quando("eu removo todos os itens") do
    @produtos_lista.each_with_index do |value, index|
        @restaurantePage.cart.removeItem(index)
    end
end
  
Então("vejo a seguinte mensagem no carrinho {string}") do |mensagem|

    expect(@restaurantePage.cart.box).to have_text mensagem
end

Quando("eu limpo o carrinho") do
    @restaurantePage.cart.limpar
end

Dado("que eu adicionei os seguintes itens no carrinho:") do |table|
    @produtos_lista = table.hashes
    steps %{
        Quando eu adiciono todos os itens no carrinho
    }
end
  
Quando("eu fecho o meu carrinho") do
    @restaurantePage.cart.fecharCarrinho
    sleep 3
end
  
Então("o valor total de itens deve ser igual a {string}") do |total|
    expect(@orderPage.freteTotal[0]).to have_text total
end
  
Então("o valor do frete deve ser igual a {string}") do |frete|
    expect(@orderPage.freteTotal[1]).to have_text frete
end
  
Então("o valor total do carrinho deve ser igual a {string}") do |totalCarrinho|
    expect(@orderPage.freteTotal[2]).to have_text totalCarrinho
end