Dado("que tenho uma lista de restaurantes") do
    @restaurante_data = [
        { nome: 'Bread & Bakery', categoria: 'Padaria', entrega: '25 minutos', avaliacao: 4.9},
        { nome: 'Burger House', categoria: 'Hamburgers', entrega: '30 minutos', avaliacao: 3.5}
    ]
end

Quando("acesso a lista de restaurantes") do
    visit '/restaurants'
end

Então("vejo todas as opções disponíveis") do
    restaurantes = all('.restaurant-item')
    expect(restaurantes.size).to be > 0
end

Então("cada restaurante deve exibir sua categoria") do

    restaurantes = all('.restaurant-item')

    @restaurante_data.each_with_index do |value, index|
        expect(restaurantes[index]).to have_text value[:categoria]
    end
end

Então("cada restaurante deve exibir o tempo de entrega") do

    restaurantes = all('.restaurant-item')

    @restaurante_data.each_with_index do |value, index|
        expect(restaurantes[index]).to have_text value[:entrega]
    end
end

Então("cada restaurante deve exibir sua nota de avaliação") do

    restaurantes = all('.restaurant-item')

    @restaurante_data.each_with_index do |value, index|
        expect(restaurantes[index]).to have_text value[:avaliacao]
    end
end
