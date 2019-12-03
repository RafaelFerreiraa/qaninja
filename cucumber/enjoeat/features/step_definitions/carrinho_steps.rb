Dado("que o produto desejado é {string}") do |produto|
    @produto_nome = produto
end

Dado("o valor do produto é de {string}") do |valor|
    produto_valor = valor
end

Quando("eu adiciono {int} unidade\\(s)") do |quantidade|
    quantidade.times do
        find(".menu-item-info-box", text: @produto_nome.upcase).find(".add-to-cart").click
    end
end

Então("deve ser adicionada {int} unidade\\(s) deste item") do |quantidade|
    carrinho = find("#cart")
    expect(carrinho).to have_text "(#{quantidade}x) #{@produto_nome}"
end

Então("o valor total deve ser de {string}") do |valor_total|
    carrinho = find("#cart")
    total = carrinho.find("tr", text: "Total:").find("td")
    expect(total.text).to eql valor_total
    sleep 5
end

# Lista de produtos

Dado("que os produtos desejados são:") do |table|
    @produtos_lista = table.hashes
    puts @produtos_lista
end

Quando("eu adiciono todos os itens no carrinho") do
    @produtos_lista.each do |p|
        p['quantidade'].to_i.times do
            find(".menu-item-info-box", text: p['nome'].upcase).find(".add-to-cart").click
        end
    end
end

Então("veto todos os itens no carrinho") do
    carrinho = find("#cart")
    @produtos_lista.each do |p|
        expect(carrinho).to have_text "(#{p['quantidade']}x) #{p['nome']}"
    end
end