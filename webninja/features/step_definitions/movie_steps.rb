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
    @moviePage.form.create(@movie)
end
  
Então("devo ver o novo filme na lista") do
    resultado = @moviePage.linhaFilme(@movie["titulo"])

    expect(resultado).to have_text @movie['titulo']
    expect(resultado).to have_text @movie['status']
end

Então("devo ver a notificação {string}") do |alertaEsperado|
    expect(@moviePage.form.alerta).to eql alertaEsperado
end

Dado("que {string} está no catálogo") do |movieCode|
    steps %{
        Dado que "#{movieCode}" é um novo filme
        E este filme já existe no catálogo
    }
end
  
Quando("eu solicito a exclusão") do
    @moviePage.removeFilme(@movie["titulo"])
end
  
Quando("eu confirmo a soliticação") do
    @moviePage.sweet_alert.confirma
end
  
Então("este item deve ser removido do catálogo") do
    sleep 3
    expect(@moviePage.filmeExcluido(@movie["titulo"])).to be true
end

Quando("cancelo a soliticação") do
    @moviePage.sweet_alert.cancela
end
  
Então("este item deve permanecer no catálogo") do
    expect(@moviePage.temFilme(@movie["titulo"])).to be true
end