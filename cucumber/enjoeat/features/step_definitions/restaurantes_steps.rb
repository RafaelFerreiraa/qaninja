Dado("que temos os seguintes restaurantes") do |table|
    @restaurante_data = table.hashes
end

Quando("acesso a lista de restaurantes") do
    visit '/restaurants'
end

Então("devo ver todos os restaurantes desta lista") do
    restaurantes = all('.restaurant-item')

    @restaurante_data.each_with_index do |value, index|
        expect(restaurantes[index]).to have_text value['nome'].upcase
        expect(restaurantes[index]).to have_text value['categoria']
        expect(restaurantes[index]).to have_text value['entrega']
        expect(restaurantes[index]).to have_text value['avaliacao']
    end
end

  
# Então("cada restaurante deve exibir {int} {string} {string} {string} {float}") do |id, nome, categoria, entrega, avaliacao|
#     restaurantes = all('.restaurant-item')

#     expect(restaurantes[id]).to have_text nome.upcase
#     expect(restaurantes[id]).to have_text categoria
#     expect(restaurantes[id]).to have_text entrega
#     expect(restaurantes[id]).to have_text avaliacao
# end

# 
# Então("vejo todas as opções disponíveis") do
    # restaurantes = all('.restaurant-item')
    # expect(restaurantes.size).to be > 0
# end
# 
# Então("cada restaurante deve exibir sua categoria") do
# 
    # restaurantes = all('.restaurant-item')
# 
    # @restaurante_data.each_with_index do |value, index|
        # expect(restaurantes[index]).to have_text value[:categoria]
    # end
# end
# 
# Então("cada restaurante deve exibir o tempo de entrega") do
# 
    # restaurantes = all('.restaurant-item')
# 
    # @restaurante_data.each_with_index do |value, index|
        # expect(restaurantes[index]).to have_text value[:entrega]
    # end
# end
# 
# Então("cada restaurante deve exibir sua nota de avaliação") do
# 
    # restaurantes = all('.restaurant-item')
# 
    # @restaurante_data.each_with_index do |value, index|
        # expect(restaurantes[index]).to have_text value[:avaliacao]
    # end
# end