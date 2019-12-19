Quando("eu faço login com {string} e {string}") do |email, senha|
    @loginPage.go
    @loginPage.logar(email, senha)
end

Então("devo ser autenticado") do
    sleep 3
    expect(getToken.length).to be 147
end

Então("devo ver {string} na área logada") do |nomeEsperado|
    expect(@sideBarPage.usuarioLogado).to eql nomeEsperado
end

Então("não devo ser autenticado") do
    expect(getToken).to be nil
end
  
Então("devo ver a mensagem de alerta {string}") do |msgEsperada|
    expect(@loginPage.alert).to eql msgEsperada
end