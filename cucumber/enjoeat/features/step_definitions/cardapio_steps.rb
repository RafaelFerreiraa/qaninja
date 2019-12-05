Dado("que acesso a lista de restaurantes") do
    @restauranteListPage.load
end

Quando("eu seleciono o restaurante {string}") do |restaurante|
    @restauranteListPage.go(restaurante)
end

Entao("vejo os seguintes itens disponíveis no cardápio:") do |table|
    itens = @restaurantePage.cardapioLista

    produtos_data = table.hashes

    produtos_data.each_with_index do |value, index|
        expect(itens[index]).to have_text value['produto'].upcase
        expect(itens[index]).to have_text value['descricao']
        expect(itens[index]).to have_text value['preco']
    end
end

Entao("eu vejo as seguintes Informacoes:") do |table|
    infos =  table.rows_hash
    detalhes = @restaurantePage.detalhes

    expect(detalhes).to have_text infos['categoria']
    expect(detalhes).to have_text infos['descricao']
    expect(detalhes).to have_text infos['horarios']
end