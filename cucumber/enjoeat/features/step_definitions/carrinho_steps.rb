Dado("que o produto desejado é {string}") do |produto|
    @produto_nome = produto
end
  
Dado("o valor do produto é de {string}") do |valor|
    produto_valor = valor
end
  
Quando("eu adiciono {int} unidade") do |int|
    find('.menu-item-info-box', text: @produto_nome.upcase).find('.add-to-cart').click
end
  
Então("deve ser adicionada {int} unidade deste item") do |quantidade|
   carrinho = find('#cart')
   expect(carrinho).to have_text "(#{quantidade}x) #{@produto_nome}"
end
  
Então("o valor total deve ser de {string}") do |valor_total|
    carrinho = find('#cart')
    total = carrinho.find('tr', text: 'Total:').find('td')
    expect(total.text).to eql valor_total
end