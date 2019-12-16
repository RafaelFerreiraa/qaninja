Dado("que {string} é um novo filme") do |movieCode|
    file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
    @movie = file[movieCode]
    Database.new.deleteMovie(@movie["titulo"])
end

Dado("este filme já existe no catálogo") do
    Database.new.insertMovie(@movie)
end
  
Quando("eu faço o cadastro desse filme") do
    @moviePage.add
    @moviePage.create(@movie)
end
  
Então("devo ver o novo filme na lista") do
    resultado = @moviePage.linhaFilme(@movie)

    expect(resultado).to have_text @movie['titulo']
    expect(resultado).to have_text @movie['status']
end

Então("devo ver a notificação {string}") do |alertaEsperado|
    expect(@moviePage.alerta).to eql alertaEsperado
end