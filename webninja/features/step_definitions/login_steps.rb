Quando("eu faço login com {string} e {string}") do |email, senha|
    @login.go
    @login.logar(email, senha)
end

Então("devo ser autenticado") do
    sleep 5
    expect(getToken.length).to be 147
end

Então("devo ver {string} na área logada") do |nomeEsperado|
    expect(@sideBar.usuarioLogado).to eql nomeEsperado
end

Então("não devo ser autenticado") do
    expect(getToken).to be nil
end
  
Então("devo ver a mensagem de alerta {string}") do |msgEsperada|
    expect(@login.alert).to eql msgEsperada
    sleep 1
end